require 'rails_helper'

RSpec.describe SmartFormHelper, type: :helper do
  before :each do
    @sub_category = FactoryGirl.build :pedreiro
    factories_to_lint = FactoryGirl.factories.select{|f|
      f.name.to_s.start_with?("field_")
    }
    @all_fields = factories_to_lint.map{|i| FactoryGirl.build i.name}
  end  
  context "mounting form_fields" do
    it "for empty params" do
      expect(mount_form_fields).to eq("")
    end
    it "build text html" do
      field_text = @all_fields.detect{|i| i.type=='text'}
      # TODO: to be continue
      @sub_category.fields( field_text.to_into )
    end
  end
end