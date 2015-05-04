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
      #@sub_category.fields
      field_text = @all_fields.detect{|i| i.type=='text'}
      result = "<input type='text' name='text' id='text'/>"
      expect(mount_form_fields(field_text.to_into)).to eq(result)
    end
    it "for select" do
      field_select = @all_fields.detect{|i| i.type=='select'}
      result = %{
        <select name='qual-e-o-tipo-de-evento' id='qual-e-o-tipo-de-evento'>
          <option value='></option>
          <option value='Bodas'>Bodas</option>
          <option value='Formatura'>Formatura</option>
          <option value='Aniversário - Adulto'>Aniversário - Adulto</option>
          <option value='Aniversário - Infantil'>Aniversário - Infantil</option>
          <option value='Debutante'>Debutante</option>
          <option value='Casamento'>Casamento</option>
          <option value='Evento corporativo'>Evento corporativo</option>
          <option value='Outros'>Outros</option>
        </select>
      }
      expect(mount_form_fields(field_select.to_into)).to eq(result.squish )
    end
    it "for checkbox" do
      field_checkbox = @all_fields.detect{|i| i.type=='checkbox'}
      result = %{
        <input type='checkbox' name='qual-profissional-voce-precisa' id='qual-profissional-voce-precisa' value='Garçom' class='qual-profissional-voce-precisa'/>Garçom
        <br/>
        <input type='checkbox' name='qual-profissional-voce-precisa' id='qual-profissional-voce-precisa' value='Garçonete' class='qual-profissional-voce-precisa'/>Garçonete
        <br/>
        <input type='checkbox' name='qual-profissional-voce-precisa' id='qual-profissional-voce-precisa' value='Copeira' class='qual-profissional-voce-precisa'/>Copeira
      }
      expect(mount_form_fields(field_checkbox.to_into).squish.gsub(" ", "")).to eq(result.squish.gsub(" ", ""))
    end    
  end
end