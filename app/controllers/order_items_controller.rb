class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order = current_order
    binding.pry
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    
    binding.pry
    session[:order_id] = @order.id
    binding.pry

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to cart_path, notice: 'Order item was successfully created.' }
        format.json { render :show, status: :created, location: @order_item }
        format.js
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])

    respond_to do |format|
      if @order_item.update_attributes(order_item_params)
          @order_items = @order.order_items
          format.html { redirect_to cart_path, notice: 'Order item was successfully updated.' }
          format.js    
      else
          format.html { render :edit }
      end
    end
  end


  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy

    @order = current_order
    @order_item = @order.order_items.find(params[:id])


    @order_item.destroy
    respond_to do |format|
      # Set the @order_items
      @order_items = @order.order_items
      format.html { redirect_to cart_path, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:book_id)
    end
end
