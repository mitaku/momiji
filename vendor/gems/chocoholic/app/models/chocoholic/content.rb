module Chocoholic
  class Content < ActiveRecord::Base
    attr_accessible :name, :ancestry
  end
end
