class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.recent.paginate(:page => params[:page], :per_page => 12)
  end

  def show
  end

  def new
    @book = Book.new
    @categories = Category.all
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
      if @book.save
        if params[:category]
          params[:category].each do |cat|
            BookCategoryRelation.create(category_id: cat, book_id: @book.id)
          end
        end
        redirect_to @book, notice: 'Book was successfully created.'
      else
      render :new
      end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      @category_id = params[:category]
      @category_id = @category_id.first.to_i
      BookCategoryRelation.create(category_id: @category_id, book_id: @book.id)
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
