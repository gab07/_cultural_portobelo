class QuotationsController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
  	@books = Book.published_books.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
  	@order_item = current_order.order_items.new
  end

  def show
    @quotation = Quotation.find(params[:id])
    @books = @quotation.books.map { |t| t.name }.join(", ")
    @client = @quotation.client
    @user = @quotation.user
  end  

  def new 
  	@quotation = Quotation.new
    @client = Client.all
  	@user = User.find(current_user.id)
  end

  def create
    @quotation = Quotation.new(quotation_params)
    @quotation.user_id = current_user.id
    if @quotation.save
      if params[:book] 
        params[:book].each do |book|
          QuotationBookRelation.create(book_id: book, quotation_id: @quotation.id)
        end
      end
      redirect_to @quotation, notice: 'La cotización se ha creado satisfactoriamente.'
    else
      render :new
    end
  end

  private
    def set_quotation
      @quotation = Quotation.find(params[:id])
      @books = @quotation.books
    end

    def quotation_params
      params.require(:quotations).permit(:subtotal, :tax, :shipping, :total, :quotation_status, user_ids: [], client_id: [])
    end

end
