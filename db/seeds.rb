# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create!(name: "blanket", description: "i'm soft", price: 45.00)
Product.create!(name: "mason jars", description: "set of 6, 16 oz. jars", price: 24.00)
Product.create!(name: "sweater", description: "merino wool", price: 101.00)


# t.string :name
# t.text :description
# t.decimal :price, precision: 9, scale: 2