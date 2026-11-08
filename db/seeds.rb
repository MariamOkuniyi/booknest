# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# BookNest Database Seed Script
# Generates sample data using the Faker gem.

require "faker"

puts "Starting BookNest database seeding..."

# Clear existing records to avoid duplicates.
Book.destroy_all
Author.destroy_all
Category.destroy_all

# Create 10 book categories.
category_names = [
  "Fiction",
  "Science",
  "Technology",
  "History",
  "Biography",
  "Business",
  "Education",
  "Health",
  "Travel",
  "Children"
]

category_names.each do |name|
  Category.create!(
    name: name,
    description: Faker::Lorem.paragraph
  )
end

puts "Created #{Category.count} categories."

# Create 20 authors.
20.times do
  Author.create!(
    name: Faker::Name.unique.name,
    country: Faker::Address.country,
    biography: Faker::Lorem.paragraph
  )
end

puts "Created #{Author.count} authors."

# Create 250 books.
250.times do
  Book.create!(
    title: "#{Faker::Book.title} #{Faker::Number.unique.number(digits: 5)}",
    description: Faker::Lorem.paragraph(sentence_count: 5),
    price: Faker::Commerce.price(range: 10.0..100.0),
    publication_year: rand(1990..2026),
    author: Author.all.sample,
    category: Category.all.sample
  )
end

puts "Created #{Book.count} books."

# Display the total number of records.
total = Author.count + Category.count + Book.count

puts "Database seeding completed successfully!"
puts "Total records: #{total}"
