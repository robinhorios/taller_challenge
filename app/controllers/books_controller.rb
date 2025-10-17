class BooksController < ApplicationController
  def show
    render json: @book
  end

  def reserve
    if @book.available?
      if reservation_params.present?
        @book.update()
      end
    end
  end

  private

  def set_book
    @book = Book.find(params["id"])

    render json: { error: "Book is not available" }, status: :not_found unless @book
  end

  def reservation_params
    params.permit(:email)
  end
end
