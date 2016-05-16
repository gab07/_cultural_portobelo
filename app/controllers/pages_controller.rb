class PagesController < ApplicationController
	def home
	end

	def about
	end

	def subheader
		@search = Search.new
	end
end
