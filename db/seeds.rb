# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
adminRole = Role.create({role_name: 'Administrator', description: 'Super-user - full admin rights', active: true})
roles = Role.create([
  {role_name: 'Landlord', description: 'Rents Properties to others', active: true}, 
  {role_name: 'Renter', description: 'Rents properties from others', active: true}, 
  {role_name: 'Support', description: 'Helps support users', active: true}, 
  {role_name: 'Accountant', description: 'Does accounting', active: true}, ])

bg = User.find(1);
bg.roles << adminRole;