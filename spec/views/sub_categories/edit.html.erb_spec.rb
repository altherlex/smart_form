require 'rails_helper'

RSpec.describe "sub_categories/edit", type: :view do
  before(:each) do
    @sub_category = assign(:sub_category, SubCategory.create!(
      :category => 1,
      :name => "MyString",
      :slug => "MyString",
      :fields => "MyText"
    ))
  end

  it "renders the edit sub_category form" do
    render

    assert_select "form[action=?][method=?]", sub_category_path(@sub_category), "post" do

      assert_select "input#sub_category_category[name=?]", "sub_category[category]"

      assert_select "input#sub_category_name[name=?]", "sub_category[name]"

      assert_select "input#sub_category_slug[name=?]", "sub_category[slug]"

      assert_select "textarea#sub_category_fields[name=?]", "sub_category[fields]"
    end
  end
end
