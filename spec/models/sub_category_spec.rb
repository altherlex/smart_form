require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  before :each do
    @sub = FactoryGirl.build :pedreiro
    factories_to_lint = FactoryGirl.factories.reject do |factory|
      factory.name =~ /^field_/
    end
    @all_fields = FactoryGirl.lint factories_to_lint    
  end  
  context "crud tests" do
    before :all do
      @params = {"fields"=>{
        "3001"=>{"order"=>"1", "title"=>"aa", "type"=>"a", "value"=>""}, 
        "37922"=>{"order"=>"2", "title"=>"q", "type"=>"qq", "value"=>""}
      }}
      @sub_category = FactoryGirl.build :sub_category
      @sub = FactoryGirl.build :pedreiro
    end

    it "slug can't be null" do 
      expect(SubCategory.new.save).to be false
    end

    it "insert fields" do 
      @sub_category.fields = @params["fields"].map{|k,i| i}
      expect( @sub_category.save ).to be true
      expect( @sub_category.reload.fields).to be @params["fields"].map{|k,i| i}
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
  context "finds" do
    it ".find_smart_form" do
      expect( SubCategory.find_smart_form(@sub.category.slug, @sub.slug) ).to be(@sub)
    end
  end
end
