# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
U1 = User.create(name: "Raj",
                 email: "raj@yahoo.com",
                 password: "whatever",
                 password_confirmation: "whatever")

A1 = User.create(name: "Shubham",
                 email: "shubham@rubyeffect.com",
                 password: "redrose",
                 password_confirmation: "redrose",role: "admin",
                 admin: true)
Product.delete_all
Product.create! id: 1, name: "Dosa", price: 25, active: true
Product.create! id: 2, name: "Pizza", price: 40, active: true
Product.create! id: 3, name: "Burger", price: 100, active: true
Product.create! id: 4, name: "Chappati", price: 200, active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
