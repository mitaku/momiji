class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable,
         :trackable, :validatable

  belongs_to :company

  has_many :category_items, :through => :category_item_users, :include => :category
  has_many :category_item_users, :foreign_key => :member_id, :dependent => :destroy

  accepts_nested_attributes_for :category_item_users

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :category_item_users_attributes

  validates :name, :presence => true

  def category_item_membership_of(category)
    category_item_users.where(:category_item_id => category.items).first || category_item_users.new({}, :without_protection => true)
  end
end
