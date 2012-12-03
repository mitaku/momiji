class UserCategory < Category
  belongs_to :owner, :class_name => "Company"
end
