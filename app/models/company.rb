class Company < ActiveRecord::Base
  attr_accessible :name, :code

  has_many :users, :dependent => :destroy
  has_many :user_categories, :dependent => :destroy, :foreign_key => :owner_id, :include => :items

  scope :where_code_is, lambda { |code| where(:code => code).limit(1) }

  validates :name, :presence => true
  validates :code, :uniqueness => true, :presence => true

  belongs_to :management, :class_name => "Company"

  def to_param
    code.to_s
  end

  def to_company
    becomes(Company)
  end

  def self.inherited(subclass)
    subclass.class_eval do
      def to_param
        id && id.to_s
      end
    end
    super
  end
end
