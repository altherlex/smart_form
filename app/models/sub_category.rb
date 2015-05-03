class SubCategory < ActiveRecord::Base
  belongs_to :category

  #attr_accessible :name, :slug
  serialize :fields, Array
  validates :slug, presence: true
  validates :slug, uniqueness: true

  #def fields=(value)
  #  raise value.inspect
  #end
end

#rails generate scaffold SubCategory category:integer name:string slug:string fields:text --skip
