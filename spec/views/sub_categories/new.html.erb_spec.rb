require 'rails_helper'

RSpec.describe "sub_categories/new", type: :view do
  before(:each) do
    assign(:sub_category, SubCategory.new(
      :category => 1,
      :name => "MyString",
      :slug => "MyString",
      :fields => "MyText"
    ))
  end

  it "renders new sub_category form" do
    render

    assert_select "form[action=?][method=?]", sub_categories_path, "post" do

      assert_select "input#sub_category_category[name=?]", "sub_category[category]"

      assert_select "input#sub_category_name[name=?]", "sub_category[name]"

      assert_select "input#sub_category_slug[name=?]", "sub_category[slug]"

      assert_select "textarea#sub_category_fields[name=?]", "sub_category[fields]"
    end
  end
end
