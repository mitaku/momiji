module Chocoholic
  class Content < ActiveRecord::Base
    attr_accessible :ancestry, :company_id, :data, :name, :owner_id, :type
  end
end
