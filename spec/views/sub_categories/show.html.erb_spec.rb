require 'rails_helper'

RSpec.describe "sub_categories/show", type: :view do
  before(:each) do
    @sub_category = assign(:sub_category, SubCategory.create!(
      :category => 1,
      :name => "Name",
      :slug => "Slug",
      :fields => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/MyText/)
  end
end
