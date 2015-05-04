require "rails_helper"

RSpec.describe SmartFormController, type: :routing do
  describe "routing" do
    before :each do
      FactoryGirl.create :pedreiro
    end

    it "routes to #show" do
      expect(:get => "/reformas-e-reparos/pedreiro").to route_to("smart_form#show", slug_categoria:"reformas-e-reparos", slug_subcategoria:"pedreiro")
    end
  end
end
