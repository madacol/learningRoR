class RazonSocialsController < ApplicationController
  #before_filter :authenticate_user!
  before_action :authenticate_user! #, except: [:index]
  before_action :set_razon_social, only: [:show, :edit, :update, :destroy]

  # GET /razon_socials
  # GET /razon_socials.json
  def index
    permission_denied and return  if current_user.cannot 'read_razon_social'
    @razon_socials = RazonSocial.all
    @new_razon_social = RazonSocial.new
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
    permission_denied and return  if current_user.cannot 'create_razon_social'
    @razon_social = RazonSocial.new(razon_social_params)

    respond_to do |format|
      if @razon_social.save
        format.html { redirect_to razon_socials_url, notice: @razon_social.table_name_to_show.concat(' fue creada satisfactoriamente.') }
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
    permission_denied and return  if current_user.cannot 'update_razon_social'
    respond_to do |format|
      if @razon_social.update(razon_social_params)
        format.html { redirect_to razon_socials_url, notice: @razon_social.table_name_to_show.concat(' was successfully updated') }        
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
    permission_denied and return  if current_user.cannot 'destroy_razon_social'
    @razon_social.destroy
    respond_to do |format|
      format.html { redirect_to razon_socials_url, notice: @razon_social.table_name_to_show+' fue eliminado satisfactoriamente.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
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
