
class Category < ApplicationRecord
  # One category can contain many books.
  has_many :books, dependent: :destroy

  # Validate category information.
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
