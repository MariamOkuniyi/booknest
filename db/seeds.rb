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


# Additional data source: Open Library
# Source: https://openlibrary.org/
# Real book titles, authors, and publication years.
# Descriptions and catalogue prices are sample values.

open_library_books = [
  {
    title: "Pride and Prejudice",
    author: "Jane Austen",
    year: 1813
  },
  {
    title: "Frankenstein",
    author: "Mary Shelley",
    year: 1818
  },
  {
    title: "The Adventures of Sherlock Holmes",
    author: "Arthur Conan Doyle",
    year: 1892
  },
  {
    title: "The Time Machine",
    author: "H. G. Wells",
    year: 1895
  },
  {
    title: "The Wonderful Wizard of Oz",
    author: "L. Frank Baum",
    year: 1900
  }
]

# Create real book records from the second source.
open_library_books.each do |book_data|

  author = Author.find_or_create_by!(
    name: book_data[:author]
  ) do |record|
    record.country = "Unknown"
    record.biography = "Author of #{book_data[:title]}."
  end

  Book.create!(
    title: book_data[:title],
    description: "A classic literary work by #{book_data[:author]}.",
    price: 19.99,
    publication_year: book_data[:year],
    author: author,
    category: Category.find_by!(name: "Fiction")
  )
end

puts "Added #{open_library_books.length} classic books."

# Display the total number of records.
total = Author.count + Category.count + Book.count

puts "Database seeding completed successfully!"
puts "Total records: #{total}"
