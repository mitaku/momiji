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

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  validates :name, :presence => true

end
