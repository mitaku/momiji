class Company < ActiveRecord::Base
  attr_accessible :name, :code

  has_many :users, :dependent => :destroy
  has_many :user_categories, :dependent => :destroy, :foreign_key => :owner_id, :include => :items

  scope :where_code_is, lambda { |code| where(:code => code).limit(1) }

  validates :name, :presence => true
  validates :code, :uniqueness => true, :presence => true

  belongs_to :management, :class_name => "Company"

  has_many :contents, :class_name => "Chocoholic::Content", :dependent => :destroy
  has_many :directories, :class_name => "Chocoholic::Directory"
  has_many :Handout, :class_name => "Chocoholic::Handout"

  after_create :create_root_directory

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

  private
  def create_root_directory
    directories.create!(:name => 'root')
  end
end
