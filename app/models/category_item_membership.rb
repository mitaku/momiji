class CategoryItemMembership < ActiveRecord::Base
  belongs_to :category_item
  has_one :category, :through => :category_item

  attr_accessible :category_item_id
end
