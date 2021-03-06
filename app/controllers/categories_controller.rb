class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.recent
  end

  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to action: "index", notice: 'Category was successfully created.' 
    else
      render :new 
    end
  end

  def update
      if @category.update(category_params)
        redirect_to @category, notice: 'Category was successfully updated.' 
      else
       render :edit 
      end
  end

  
  def destroy
    @category.destroy
      redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
