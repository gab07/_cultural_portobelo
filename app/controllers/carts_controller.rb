class CartsController < ApplicationController
  def show
    @quotation_items = current_quotation.quotation_items
  end
end
