class CategoryItem < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name

  scope :where_category_name_is, lambda { |name| joins(:category).where("categories.name = ?", name) }
end
