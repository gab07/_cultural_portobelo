class StepsController < ApplicationController
	 include Wicked::Wizard
	  steps :pick_books, :checkout
	  
	  def show
	  	if params[:search]
	    	@quotation = current_quotation
	  	  @books = Book.published_books.search(params[:search]).paginate(:page => params[:page], :per_page => 8)
	  	  @quotation_item = current_quotation.quotation_items.new
	    	render_wizard
	  	else
	    	@quotation = current_quotation
	  	  @books = Book.published_books.recent.paginate(:page => params[:page], :per_page => 8)
	  	  @quotation_item = current_quotation.quotation_items.new
	    	render_wizard
	  	end
	  end
	  
	  def update
	    @quotation = current_quotation
	    @quotation.attributes = params[:quotation]
	    render_wizard @quotation
	  end
	  
	private
	  def redirect_to_finish_wizard
	    redirect_to root_url, notice: "Thank you for signing up."
	  end
end
