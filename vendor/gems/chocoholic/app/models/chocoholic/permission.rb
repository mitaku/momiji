module Chocoholic
  class Permission < ActiveRecord::Base
    attr_accessible :readonly, :writable

    belongs_to :resource, :polymorphic => true
  end
end
