class Category < ActiveRecord::Base
  attr_accessible :name, :items_attributes

  has_many :items, :class_name => "CategoryItem", :dependent => :destroy
  accepts_nested_attributes_for :items, :allow_destroy => true
end
