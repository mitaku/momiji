module Chocoholic
  class Content < ActiveRecord::Base
    attr_accessible :name, :ancestry
    attr_accessible :user_permissions_attributes, :category_item_user_permissions_attributes
    attr_accessible :tag_list

    belongs_to :company, :class_name => "::Company"
    has_ancestry

    validates :name, :uniqueness => {:scope => [:company_id, :ancestry]}, :presence => true

    has_many :permissions, :dependent => :destroy
    accepts_nested_attributes_for :permissions, :allow_destroy => true

    has_many :user_permissions, :dependent => :destroy, :conditions => "resource_type = 'User'", :class_name => "::Chocoholic::Permission", :foreign_key => :content_id
    accepts_nested_attributes_for :user_permissions, :allow_destroy => true

    has_many :category_item_user_permissions, :dependent => :destroy, :conditions => "resource_type = 'CategoryItem'", :class_name => "Chocoholic::Permission"
    accepts_nested_attributes_for :category_item_user_permissions, :allow_destroy => true

    acts_as_taggable


    def icon_path
      "chocoholic/filetype/#{file_type}.png"
    end

    def becomes_content
      becomes(Content)
    end

    def directory?
      false
    end

    def file_type
      raise NotImprementError
    end

    def check_access_permission
      ancestor
    end

    def accessable?(obj)
      case obj
      when ::User
      else
      end
    end
  end
end
