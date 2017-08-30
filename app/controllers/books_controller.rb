class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
      @quotation_item = current_quotation.quotation_items.new
    
    if params[:search]
      @books = Book.published_books.search(params[:search]).paginate(:page => params[:page], :per_page => 12)
      @quotation_item    
    else
      @books = Book.published_books.recent.paginate(:page => params[:page], :per_page => 8)
      @quotation_item    
    end
  end

  def show
    @books = Book.random
    @book = Book.find(params[:id])
    @categories = @book.categories.map { |t| t.name }.join(", ")
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
    if @book.destroy
      redirect_to books_url, success: 'Libro se ha eliminado.' 
    else
      redirect_to books_url, danger: 'No se pudo eliminar el libro.'
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
      @categories = @book.categories
    end

    def book_params
      params.require(:book).permit(:title, :author, :price, :publisher, :publication_year, :cover, :country_of_origin, :description, :published, :new_book, category_ids: [])
    end

end
