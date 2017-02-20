class QuotationsController < ApplicationController
  def index
  	@books = Book.published_books.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
  	@order_item = current_order.order_items.new
  end
end
