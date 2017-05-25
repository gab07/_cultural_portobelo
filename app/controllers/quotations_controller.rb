class QuotationsController < ApplicationController
	before_action :set_quotation, only: [:show]

	def index
		@quotations = Quotation.all
	end

	def show
		@quotation_items = current_quotation.quotation_items
	end

	private
	def set_quotation
		@quotation = Quotation.find(params[:id])
	end
end