class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.references :category
      t.text :title
      t.text :name
      t.text :slug, :unique => true, :null => false
      t.text :fields

      t.timestamps
    end
    add_index :sub_categories, :category_id
  end
end
