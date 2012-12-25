module RsetMcm
  class Content < ActiveRecord::Base
    belongs_to :company
    attr_accessible :ancestry, :name

    validates :name, :uniqueness => {:scope => [:company_id, :ancestry]},
                     :length => {:maximum => 60, :allow_blank => true},
                     :presence => true

    def becomes_content
      becomes(Content)
    end

    def directory?
      raise NotImprementError
    end
  end
end
