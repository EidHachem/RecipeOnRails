require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Seeding database..."

p "Creating users..."
5.times do
  User.create(name: Faker::Name.unique.name, email: Faker::Internet.email, password: "123456", password_confirmation: "123456")
end

# User.create(name: "John Doe", email: "johndoe@gmail.com", password: "123456", password_confirmation: "123456")
# User.create(name: "Jane Doe", email: "janedoe@gmail.com", password: "123456", password_confirmation: "123456")
# User.create(name: "John Smith", email: "johnsmith@gmail.com", password: "123456", password_confirmation: "123456")
# User.create(name: "Jane Smith", email: "janesmith@gmailcom", password: "123456", password_confirmation: "123456")

p "Creating recipes..."
200.times do
  Recipe.create(name: Faker::Food.dish, preparation_time: Faker::Number.between(from: 1, to: 10), cooking_time: Faker::Number.between(from: 1, to: 10), description: Faker::Lorem.paragraph, user_id: Faker::Number.between(from: 1, to: 5), public: Faker::Boolean.boolean)
end

# Recipe.create(name: "Pizza", preparation_time: "30 minutes", cooking_time: "30 minutes", description: "This is a pizza recipe", public: true, user_id: 1)
# Recipe.create(name: "Pasta", preparation_time: "30 minutes", cooking_time: "30 minutes", description: "This is a pasta recipe", public: true, user_id: 2)
# Recipe.create(name: "Burger", preparation_time: "30 minutes", cooking_time: "30 minutes", description: "This is a burger recipe", public: false, user_id: 1)
# Recipe.create(name: "Salad", preparation_time: "30 minutes", cooking_time: "30 minutes", description: "This is a salad recipe", public: false, user_id: 2)

p "Creating foods..."
200.times do
  Food.create(name: Faker::Food.ingredient, price: Faker::Number.between(from: 1, to: 1000), quantity: Faker::Number.between(from: 1, to: 100), measurement_unit: "kg", user_id: Faker::Number.between(from: 1, to: 5))
end

# Food.create(name: "Flour", price: 1.5, quantity: 1, measurement_unit: "kg", user_id: 1)
# Food.create(name: "Tomato", price: 1.5, quantity: 1, measurement_unit: "kg", user_id: 2)
# Food.create(name: "Cheese", price: 1.5, quantity: 1, measurement_unit: "kg", user_id: 1)
# Food.create(name: "Bread", price: 1.5, quantity: 1, measurement_unit: "kg", user_id: 2)

p "Database seeded!"

p "Successfully created #{User.count} users"
p "Successfully created #{Recipe.count} recipes"
p "Successfully created #{Food.count} foods"
