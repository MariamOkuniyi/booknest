
class CategoriesController < ApplicationController
  # Display all categories alphabetically.
  def index
    @categories = Category.order(:name)
  end

  # Display a selected category and its books.
  def show
    @category = Category.find(params[:id])

    # Retrieve books belonging to this category.
    @books = @category.books
                      .includes(:author)
                      .order(:title)
  end
end
