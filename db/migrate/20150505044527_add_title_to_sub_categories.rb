class AddTitleToSubCategories < ActiveRecord::Migration
  def change
    add_column :sub_categories, :title, :text
  end
end
