class Company < ActiveRecord::Base
  attr_accessible :name, :code

  has_many :users

  scope :where_code_is, lambda { |code| where(:code => code).limit(1) }

  validates :name, :presence => true
  validates :code, :uniqueness => true, :presence => true

  def to_param
    code.to_s
  end
end
