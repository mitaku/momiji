class Company < ActiveRecord::Base
  attr_accessible :name, :code

  has_many :users
end
