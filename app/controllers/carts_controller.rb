class CartsController < ApplicationController
  def show
    @quotation_items = current_order.quotation_items
  end
end
