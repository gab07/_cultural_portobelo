class QuotationsController < ApplicationController

  def index
  	@books = Book.published_books.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
  	@quotation_item = current_quotation.quotation_items.new
  end

  def new
  	@quotation = current_quotation
  	@clients = Client.all
  	@client = Client.new
  	# @books = Book.published_books.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
  	# @quotation_item = current_quotation.quotation_items.new
  end

  def create
  	client_id = params[:quotation][:client_id]
  	@quotation = current_quotation
  	@quotation.user_id = current_user.id
  	@quotation.client_id = client_id
  	if @quotation.save
  		redirect_to '/'
  	else 
  		redirect_to :new
  	end
  end

  private


  	def quotation_params
  		params.require(:quotation).permit(:user_id, :client_id)
  	end
end
