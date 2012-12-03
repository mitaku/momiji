class Category < ActiveRecord::Base
  attr_accessible :name, :owner_id, :type
end
