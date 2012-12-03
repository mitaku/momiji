class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :items, :class_name => "CategoryItem", :dependent => :destroy
end
