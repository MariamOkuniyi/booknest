
# BookNest — Online Book Catalogue

## Project Overview
BookNest is a Ruby on Rails web application that allows
users to browse, search, and explore books organized by
authors and categories.

This project was developed as part of the Rails Intro
Project assignment at RRC Polytech.

## Technologies Used
- Ruby on Rails
- Ruby
- SQLite
- ActiveRecord
- Bootstrap 5
- HTML5 and ERB
- Faker
- Kaminari (Pagination)

## Database Structure
The application uses three related tables:

1. Authors — stores author names, countries, and biographies.
2. Categories — stores book categories and descriptions.
3. Books — stores book titles, descriptions, prices,
   publication years, and references to authors and categories.

### Database Relationships
- An Author has many Books.
- A Category has many Books.
- A Book belongs to one Author.
- A Book belongs to one Category.

## Entity Relationship Diagram (ERD)

![BookNest ERD](docs/BookERD.png)

## Data Sources
Faker generates sample book titles, author names,
biographies, descriptions, and prices.

Ten predefined categories are also used.

The database contains:
- 250 books
- 20 authors
- 10 categories
- 280 records in total

## Application Features
- Browse the book catalogue
- View individual book details
- Search books by title
- Filter books by category
- Browse category-specific collections
- Navigate between books and categories
- Paginate book results
- View author information
- About page describing the project
- Responsive Bootstrap layout

## Running the Application

Install dependencies:

    bundle install

Prepare and seed the database:

    rails db:prepare
    rails db:seed

Start the Rails server:

    rails server

Open http://localhost:3000 in your browser.
