class CategoryItem < ActiveRecord::Base
  belongs_to :category
  has_many :category_item_memberships, :dependent => :destroy
  attr_accessible :name

  scope :where_category_name_is, lambda { |name| joins(:category).where("categories.name = ?", name) }
  scope :where_category_is, lambda { |category| joins(:category).where("categories.id = ?", category) }
end
