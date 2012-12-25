module RsetMcm
  class Content < ActiveRecord::Base
    belongs_to :company
    attr_accessible :ancestry, :data, :file_size, :name, :type
  end
end
