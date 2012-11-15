class Provider < Company
  has_many :customers, :dependent => :restrict, :foreign_key => :management_id, :class_name => 'Customer'
end
