
class BooksController < ApplicationController
  # Display books and allow searching and filtering.
  def index
    @categories = Category.order(:name)

    # Load all books with their authors and categories.
    @books = Book.includes(:author, :category)

    # Filter books by title when a search term is provided.
    if params[:search].present?
      @books = @books.where(
        "LOWER(books.title) LIKE ?",
        "%#{params[:search].downcase}%"
      )
    end

    # Filter books by the selected category.
    if params[:category_id].present?
      @books = @books.where(category_id: params[:category_id])
    end

   # Sort books alphabetically and display 12 per page.
  @books = @books.order(:title).page(params[:page]).per(12)
  end

  # Display the details of a single book.
  def show
    @book = Book.find(params[:id])
  end
end
