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
User.all.each do |user|
  5.times do
    user.recipes.create(name: Faker::Food.unique.dish, preparation_time: Faker::Number.between(from: 1, to: 10), cooking_time: Faker::Number.between(from: 1, to: 10), description: Faker::Food.description, public: Faker::Boolean.boolean)
  end
end

# Recipe.create(name: "Pizza", preparation_time: "30 minutes", cooking_time: "30 minutes", description: "This is a pizza recipe", public: true, user_id: 1)
# Recipe.create(name: "Pasta", preparation_time: "30 minutes", cooking_time: "30 minutes", description: "This is a pasta recipe", public: true, user_id: 2)
# Recipe.create(name: "Burger", preparation_time: "30 minutes", cooking_time: "30 minutes", description: "This is a burger recipe", public: false, user_id: 1)
# Recipe.create(name: "Salad", preparation_time: "30 minutes", cooking_time: "30 minutes", description: "This is a salad recipe", public: false, user_id: 2)

p "Creating foods..."
User.all.each do |user|
  50.times do
    user.foods.create(name: Faker::Food.unique.ingredient, price: Faker::Number.between(from: 1, to: 10), quantity: Faker::Number.between(from: 1, to: 10), measurement_unit: Faker::Food.metric_measurement)
  end
end

# Food.create(name: "Flour", price: 1.5, quantity: 1, measurement_unit: "kg", user_id: 1)
# Food.create(name: "Tomato", price: 1.5, quantity: 1, measurement_unit: "kg", user_id: 2)
# Food.create(name: "Cheese", price: 1.5, quantity: 1, measurement_unit: "kg", user_id: 1)
# Food.create(name: "Bread", price: 1.5, quantity: 1, measurement_unit: "kg", user_id: 2)

p "Creating recipe_foods..."
200.times do
  RecipeFood.create(quantity: Faker::Food.measurement, recipe_id: Recipe.ids.sample, food_id: Food.ids.sample)
end

p "Database seeded!"

p "Successfully created #{User.count} users"
p "Successfully created #{Recipe.count} recipes"
p "Successfully created #{Food.count} foods"
p "Successfully created #{RecipeFood.count} recipe_foods"
