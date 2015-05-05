require 'rails_helper'

RSpec.describe SmartFormHelper, type: :helper do
  before :each do
    @sub_category = FactoryGirl.build :pedreiro
    factories_to_lint = FactoryGirl.factories.select{|f|
      f.name.to_s.start_with?("field_")
    }
    @all_fields = factories_to_lint.map{|i| FactoryGirl.build i.name}
  end  
  it "name_2_variable" do
    expect( helper.name_2_variable("Quantos convidados são esperados?") ).to eq("quantos-convidados-sao-esperados")
  end
  context "mounting form_fields" do
    it "for empty params" do
      expect(mount_form_fields).to eq("")
    end
    it "for text" do
      field_text = @all_fields.detect{|i| i.type=='text'}
      expect(mount_form_fields(field_text.to_into)).to have_tag(:label) do
        with_text field_text.title
      end
      expect(mount_form_fields(field_text.to_into)).to have_tag(:input, with:{type:'text', name:'quantos-convidados-sao-esperados'})
    end
    it "for textarea" do
      field_text = @all_fields.detect{|i| i.type=='textarea'}
      expect(mount_form_fields(field_text.to_into)).to have_tag(:label) do
        with_text field_text.title
      end
      expect(mount_form_fields(field_text.to_into)).to have_tag(:textarea, with:{name:"informacoes-adicionais"})
    end
    it "for select" do
      field_select = @all_fields.detect{|i| i.type=='select'}
      expect(mount_form_fields(field_select.to_into)).to have_tag(:label) do
        with_text field_select.title
      end
      expect(mount_form_fields(field_select.to_into)).to have_tag('select', with:{name:'qual-e-o-tipo-de-evento'}) do
        with_tag "option"
        with_tag "option", with:{value:'Bodas'}
        with_tag "option", with:{value:'Formatura'}
        with_tag "option", with:{value:'Aniversário - Adulto'}
        with_tag "option", with:{value:'Aniversário - Infantil'}
        with_tag "option", with:{value:'Debutante'}
        with_tag "option", with:{value:'Casamento'}
        with_tag "option", with:{value:'Evento corporativo'}
        with_tag "option", with:{value:'Outros'}        
      end
    end
    it "for checkbox" do
      field_checkbox = @all_fields.detect{|i| i.type=='checkbox'}
      #expect(mount_form_fields(field_checkbox.to_into).squish.gsub(" ", "")).to eq(result.squish.gsub(" ", ""))
      expect(mount_form_fields(field_checkbox.to_into)).to have_tag('input', with:{name:"qual-profissional-voce-precisa[0]", type:'checkbox', value:'Garçom'})
    end    
  end
end