class Api::BooksController < ApplicationController
  respond_to :json

  def index
    if params[:search]
      @books = Book.search(params[:search]).all
    end
    render :index
  end
end