class QuotationItemsController < ApplicationController
	  def create
	    @quotation = current_quotation
	    @quotation_item = @quotation.quotation_items.new(quotation_item_params)
	    @quotation.save
	    binding.pry
	    session[:quotation_id] = @quotation.id
	  end

	  def update
	    @quotation = current_quotation
	    @quotation_item = @quotation.quotation_items.find(params[:id])
	    @quotation_item.update_attributes(quotation_item_params)
	    @quotation_items = @quotation.quotation_items
	  end

	  def destroy
	    @quotation = current_quotation
	    @quotation_item = @quotation.quotation_items.find(params[:id])
	    @quotation_item.destroy
	    @quotation_items = @quotation.quotation_items
	  end

	private
	  def quotation_item_params
	    params.require(:quotation_item).permit(:quantity, :book_id, :quotation_id)
	  end
end
