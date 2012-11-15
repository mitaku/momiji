# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = Administration.create(code: "admin_test", name: "admin_test")
a.users.create do |u|
  u.email = "admin@example.com"
  u.name = "admin_test_user"
  u.password = "testtest"
  u.password_confirmation = "testtest"
end.tap { |u| u.add_role "admin" }

p = Provider.create(code: "provider_test", name: "provider_test")
p.management = a
p.save!

p.users.create do |u|
  u.email = "provider@example.com"
  u.name = "provider_test_user"
  u.password = "testtest"
  u.password_confirmation = "testtest"
end.tap { |u| u.add_role "admin" }

c = Customer.create(code: "test", name: "test")
c.management = p
c.save!
c.users.create do |u|
  u.email = "test@example.com"
  u.name = "test_user"
  u.password = "testtest"
  u.password_confirmation = "testtest"
end.tap { |u| u.add_role "admin" }
