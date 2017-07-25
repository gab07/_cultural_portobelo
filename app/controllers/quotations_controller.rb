class QuotationsController < ApplicationController
	before_action :set_quotation, only: [:show, :create, :edit]

	def index
		@quotations = Quotation.all
	end

	def edit
	end


	def show
		@quotation_items = current_quotation.quotation_items
		@client = Client.find(current_quotation.client_id)
		@user = User.find(@quotation.user_id)
	end

	def new
		@quotation = current_quotation
	end

	def create
		binding.pry
		@quotation.client_id = params[:quotation][:client_id]
		@quotation.user_id = current_user.id
		if @quotation.save
			session[:quotation_id] = @quotation.id
			redirect_to '/books'
		else
			render :new
		end
	end

	def update
		binding.pry
		@quotation = current_quotation
		binding.pry
		if @quotation.update(quotation_params)
			redirect_to '/books'
		else
			:edit
		end
	end

	private
	def set_quotation
		@quotation = current_quotation
	end

	def quotation_params
		params.require(:quotation).permit(:subtotal, :tax, :shipping, :total, :user_id, :client_id,)
	end
end