class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all.order('created_at DESC')
  end

  def show
  end

  def new
    @book = Book.new
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
    respond_to do |format|
      if @book.update(book_params)
        redirect_to @book, notice: 'Book was successfully updated.' 
      else
        render :edit 
      end
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
      params.require(:book).permit(:title, :author, :price, :publisher, :publication_year, :isbn, :pages, :binding_type, :language, :price, :cover)
    end
end
