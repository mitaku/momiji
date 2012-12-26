# -*- coding: utf-8 -*-

module RsetMcm
  class Content < ActiveRecord::Base
    belongs_to :company
    attr_accessible :ancestry, :name

    validates :name, :uniqueness => {:scope => [:company_id, :ancestry]},
                     :length => {:maximum => 60, :allow_blank => true},
                     :presence => true

    has_many :permissions, :dependent => :destroy

    has_ancestry
    acts_as_taggable

    def icon_path
      "rset_mcm/filetype/#{file_type}.png"
    end

    def becomes_content
      becomes(Content)
    end

    def file_type
      raise NotImprementError
    end

    def directory?
      raise NotImprementError
    end

    def authority_of(obj)
      set = Set.new([])
      ancestors.joins(:permissions).includes(:permissions).each do |content|
        authority = content.authority(obj)
        return Set.new([:prohibit]) if authority.include?(:prohibit)
        set = authority unless authority.empty?
      end
      set
    end

    # @return Set
    def authority(obj)
      set = Set.new([])
      if permissions.exists?
        permissions.each do |permission|
          set.add(permission.mode.to_sym) if true #TODO
        end
      end
      set
    end
  end
end
