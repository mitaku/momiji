class CategoryItemMembership < ActiveRecord::Base
  belongs_to :category_item
  has_one :category, :through => :category_item
end
