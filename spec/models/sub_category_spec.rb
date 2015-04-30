require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  context "crud tests" do
    it "slug can't be null" do 
      expect(SubCategory.new.save).to be false
    end
  end
  context "with fields" do
    before :all do
      @field = FactoryGirl.build(:field)
    end
    it "will be Array instance" do
      sub_cat = SubCategory.create!(slug:'pedreiro' ,fields: [@field.to_into])
      expect(sub_cat.reload.fields).to be_instance_of(Array)
    end
  end
end
