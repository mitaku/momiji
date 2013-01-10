# -*- coding: utf-8 -*-

module RsetMcm
  class Content < ActiveRecord::Base
    belongs_to :company
    attr_accessible :ancestry, :name

    validates :name, :uniqueness => {:scope => [:company_id, :ancestry]},
                     :length => {:maximum => 60, :allow_blank => true},
                     :presence => true

    has_many :permissions, :dependent => :destroy

    has_many :user_permissions, :dependent => :destroy, :conditions => "resource_type = 'User'", :class_name => "::RsetMcm::Permission", :foreign_key => :content_id
    accepts_nested_attributes_for :user_permissions, :allow_destroy => true
    attr_accessible :user_permissions_attributes

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

      # parents
      ancestors.joins(:permissions).includes(:permissions).each do |content|
        auth = content.authority(obj)
        return Set.new([:prohibit]) if auth.include?(:prohibit)
        set = auth unless auth.empty?
      end

      # self
      current_authority = self.authority(obj)
      return Set.new([:prohibit]) if current_authority.include?(:prohibit)
      set = current_authority unless current_authority.empty?

      set
    end

    # @return Set
    def authority(obj)
      set = Set.new([])
      if permissions.exists?
        results = permissions.where(:resource_type => 'User').where(:resource_id => obj.id).to_a
        if results.present?
          results.each do |permission|
            set.add(permission.mode.to_sym)
          end
        else
          set.add(:prohibit)
        end
      end
      set
    end

    def tag_list
      owner_tags_on(company, :tags)
    end

    def tag_list=(new_tags)
      set_owner_tag_list_on(company, :tags, new_tags)
    end
  end
end
