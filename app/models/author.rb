
class Author < ApplicationRecord
  # One author can have many books.
  has_many :books, dependent: :destroy

  # Validate the author's information.
  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
  validates :biography, presence: true
end
