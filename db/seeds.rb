# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c = Customer.create(code: "test", name: "test")
c.users.create do |u|
  u.email = "test@example.com"
  u.name = "test_user"
  u.password = "testtest"
  u.password_confirmation = "testtest"
end
