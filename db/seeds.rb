# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
100.times do
  Product.create!(
    title: Faker::Commerce.product_name,
    status: Faker::Boolean.boolean(true_ratio: 0.9), 
    description: Faker::Lorem.paragraph(sentence_count: 3),
    image: Faker::LoremFlickr.image(size: "200x200"),
    category: Faker::Commerce.department(max: 1, fixed_amount: true)
  )
end
