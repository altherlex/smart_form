class Category < ActiveRecord::Base
  has_many :sub_categories
  validates :slug, presence: true
  validates :slug, uniqueness: true

  #attr_accessible :name, :slug
  before_validation do |record|
    if not record.slug.present? and record.new_record?
      record.slug = ActiveSupport::Inflector.transliterate(record.name).downcase.gsub(' ', '-')
    end
  end
end
#rails generate scaffold Category name:string slug:string --skip
