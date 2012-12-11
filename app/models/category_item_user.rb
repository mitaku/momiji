class CategoryItemUser < CategoryItemMembership
  belongs_to :member, :class_name => 'User'
  # attr_accessible :title, :body
end
