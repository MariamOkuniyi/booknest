
class Book < ApplicationRecord
  # Each book belongs to one author and one category.
  belongs_to :author
  belongs_to :category

  # Ensure every book has a title.
  validates :title, presence: true

  # Ensure the description is provided.
  validates :description, presence: true

  # Ensure the price is provided and cannot be negative.
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }

  # Ensure the publication year is valid.
  validates :publication_year, presence: true,
                               numericality: {
                                 only_integer: true,
                                 greater_than: 0
                               }
end
