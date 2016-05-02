class RazonSocialsController < ApplicationController
  #before_filter :authenticate_user!

  before_action :set_razon_social, only: [:show, :edit, :update, :destroy]

  # GET /razon_socials
  # GET /razon_socials.json
  def index
    @razon_socials = RazonSocial.all
    logger.debug current_user
  end

  # GET /razon_socials/1
  # GET /razon_socials/1.json
  def show
  end

  # GET /razon_socials/new
  def new
    @razon_social = RazonSocial.new
  end

  # GET /razon_socials/1/edit
  def edit
  end

  # POST /razon_socials
  # POST /razon_socials.json
  def create
    @razon_social = RazonSocial.new(razon_social_params)

    respond_to do |format|
      if @razon_social.save
        format.html { redirect_to @razon_social, notice: @razon_social.table_name_to_show+' was successfully created.' }
        format.json { render :show, status: :created, location: @razon_social }
      else
        format.html { render :new }
        format.json { render json: @razon_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /razon_socials/1
  # PATCH/PUT /razon_socials/1.json
  def update
    respond_to do |format|
      if @razon_social.update(razon_social_params)
        format.html { redirect_to @razon_social, notice: @razon_social.table_name_to_show+' was successfully updated.' }
        format.json { render :show, status: :ok, location: @razon_social }
      else
        format.html { render :edit }
        format.json { render json: @razon_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /razon_socials/1
  # DELETE /razon_socials/1.json
  def destroy
    @razon_social.destroy
    respond_to do |format|
      format.html { redirect_to razon_socials_url, notice: @razon_social.table_name_to_show+' was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_razon_social
      @razon_social = RazonSocial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def razon_social_params
      params.require(:razon_social).permit(:rif_ci, :name, :description, :phone, :email, :address, :contact_name, :contact_phone, :contact_email)
    end
end
