class QuotationsController < ApplicationController
  def index
  	@books = Book.published_books
  	@order_item = current_order.order_items.new
  end
end
