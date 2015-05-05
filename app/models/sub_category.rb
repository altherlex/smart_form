class SubCategory < ActiveRecord::Base
  belongs_to :category

  #attr_accessible :name, :slug
  serialize :fields, Array
  validates :slug, presence: true
  validates :slug, uniqueness: true

  def self.find_smart_form(slug_categoria, slug_subcategoria)
    joins(:category)
    .where("categories.slug = ? and sub_categories.slug = ?", slug_categoria, slug_subcategoria)
  end
end

#rails generate scaffold SubCategory category:integer name:string slug:string fields:text --skip
