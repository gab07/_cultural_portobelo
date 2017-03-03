class ClientsController < ApplicationController
	before_action :set_client, only: [:show, :edit, :update, :destroy]

	def create
	@client = Client.new(client_params)
		if @client.save
			redirect_to '/clients'
		else
			render :new
		end
	end

	def destroy
    if @client.destroy
      redirect_to clients_url, success: 'El cliente #{@client.name} se ha eliminado.' 
    else
      redirect_to clients_url, danger: 'No se pudo eliminar #{@client.name}.'
    end
  end

	def edit
	end

	def index
		@clients = Client.all
	end

	def new
		@client = Client.new
	end

	def show
	end

	def update
	  if @client.update(client_params)
	    redirect_to @client, notice: 'La información del cliente #{@client.name} se ha actualizado correctamente.' 
	  else
	   	render :edit 
	  end
  end

private
	def set_client
		@client = Client.find(params[:id])
	end

	def client_params
		params.require(:client).permit(:name, :ruc, :dv)
	end

end