require 'rails_helper'

RSpec.describe "sub_categories/index", type: :view do
  before(:each) do
    assign(:sub_categories, [
      SubCategory.create!(
        :category => 1,
        :name => "Name",
        :slug => "Slug",
        :fields => "MyText"
      ),
      SubCategory.create!(
        :category => 1,
        :name => "Name",
        :slug => "Slug",
        :fields => "MyText"
      )
    ])
  end

  it "renders a list of sub_categories" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
