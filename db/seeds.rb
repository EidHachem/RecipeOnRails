# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Seeding database..."

User.create(name: "John Doe", email: "johndoe@gmail.com", password: "123456", password_confirmation: "123456")

p "Created #{User.count} users"
p "Database seeded!"
