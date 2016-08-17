class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.recent.paginate(:page => params[:page], :per_page => 16)
  end

  def show
  end

  def new
    @book = Book.new
    @categories = Category.all
  end

  def edit
    @categories = @book.categories
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
    if @book.update(book_params)
      @category_id = params[:category]
      unless @category_id.nil?
        BookCategoryRelation.create(category_id: @category_id, book_id: @book.id)
      end
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
      @categories = @book.categories 
      @categories = {'category_ids' => []}.merge(params[:book] || {})
    end

    def book_params
      params.require(:book).permit(:title, :author, :price, :publisher, :publication_year, :cover, :country_of_origin, :description, category_ids: [])
    end

end
