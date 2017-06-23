class ClientsController < ApplicationController
	  before_action :set_client, only: [:show, :edit, :update, :destroy]


	  # GET /clients
	  # GET /clients.json
	  def index
	     respond_to do |format|
	      format.html { @clients = Client.paginate(:page => params[:page], :per_page => 8)}
	    end
	    #@clients = client.all
	  end

	  # GET /clients/1
	  # GET /clients/1.json
	  def show
	  end

	  # GET /clients/new
	  def new
	    @client = Client.new
	  end

	  # GET /clients/1/edit
	  def edit
	  end

	  # POST /clients
	  # POST /clients.json
	  def create
	    @client = Client.new(client_params)
	    respond_to do |format|
	      if @client.save
	        format.html { redirect_to clients_path, success: 'client creado exitosamente.' }
	        format.json { render :show, status: :created, location: @client }
	        format.js
	      else
	        format.html { render :new }
	        format.json { render json: @client.errors, status: :unprocessable_entity }
	        format.js
	      end
	    end
	  end

	  # PATCH/PUT /clients/1
	  # PATCH/PUT /clients/1.json
	  def update
	    respond_to do |format|
	      if @client.update(client_params)
	        format.html { redirect_to @client, success: 'client editado exitosamente.' }
	        format.json { render :show, status: :ok, location: @client }
	      else
	        format.html { render :edit }
	        format.json { render json: @client.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  # DELETE /clients/1
	  # DELETE /clients/1.json
		def destroy
	   	respond_to do |format|
	    	if @client.destroy
	      	format.html { redirect_to clients_path, success: 'client eliminado exitosamente.' }
	      	format.json { head :no_content }
	     	else
	      	format.html { redirect_to clients_url, danger: 'No se pudo eliminar client- existen asociaciones.' }
	    	end
	  	end
		end

	  private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_client
	      @client = Client.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def client_params
	     params.require(:client).permit(:name, :ruc, :dv)
	    end	
end
