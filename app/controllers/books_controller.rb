class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    if @books.nil?
      @books = Book.search(params[:search])
    end
    @search = Search.new
  end

  def show
    if params[:id].nil?
      @search = Search.find(params[:id])
    end
    @books = Book.search(params[:search])
  end

  def new
    @book = Book.new
    @categories = [ 'Procesal Penal','Comercial', 'Civil','Familia']
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
      if @book.save
        redirect_to @book, notice: 'Book was successfully created.'
      else
      render :new
      end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @book.destroy
      redirect_to books_url, notice: 'Book was successfully destroyed.' 
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :price, :publisher, :publication_year, :cover, :country_of_origin)
    end
end
