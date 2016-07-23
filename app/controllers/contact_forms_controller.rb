# encoding: utf-8

class ContactFormsController < ApplicationController
  before_action :set_contact_form, only: [:show, :edit, :update, :destroy]

  # GET /contact_forms
  # GET /contact_forms.json
  def index
    @contact_forms = ContactForm.all
  end

  # GET /contact_forms/1
  # GET /contact_forms/1.json
  def show
  end

  # GET /contact_forms/new
  def new
    @contact_form = ContactForm.new
  end

  # GET /contact_forms/1/edit
  def edit
  end

  # POST /contact_forms
  # POST /contact_forms.json
  def create
  @contact_form = ContactForm.new(contact_form_params)
    if @contact_form.save
      redirect_to '/', notice: '¡Gracias por su comentario!'
    else
      render :new 
    end
  end

  # PATCH/PUT /contact_forms/1
  # PATCH/PUT /contact_forms/1.json
  def update
    respond_to do |format|
      if @contact_form.update(contact_form_params)
        format.html { redirect_to @contact_form, notice: 'Contact form was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_form }
      else
        format.html { render :edit }
        format.json { render json: @contact_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_forms/1
  # DELETE /contact_forms/1.json
  def destroy
    @contact_form.destroy
    respond_to do |format|
      format.html { redirect_to contact_forms_url, notice: 'Contact form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_form
      @contact_form = ContactForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_form_params
      params.require(:contact_form).permit(:name, :email, :phone, :profession, :comment)
    end
end
