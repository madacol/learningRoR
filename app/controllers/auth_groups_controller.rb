class AuthGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_auth_group, only: [:show, :edit, :update, :destroy]

  # GET /auth_groups
  # GET /auth_groups.json
  def index
    @auth_groups = AuthGroup.all
  end

  # GET /auth_groups/1
  # GET /auth_groups/1.json
  def show
  end

  # GET /auth_groups/new
  def new
    @auth_group = AuthGroup.new
  end

  # GET /auth_groups/1/edit
  def edit
  end

  # POST /auth_groups
  # POST /auth_groups.json
  def create
    @auth_group = AuthGroup.new(auth_group_params)

    respond_to do |format|
      if @auth_group.save
        format.html { redirect_to @auth_group, notice: AuthGroup.new.table_name_to_show.concat(' was successfully created.') }
        format.json { render :show, status: :created, location: @auth_group }
      else
        format.html { render :new }
        format.json { render json: @auth_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_groups/1
  # PATCH/PUT /auth_groups/1.json
  def update
    respond_to do |format|
      if @auth_group.update(auth_group_params)
        format.html { redirect_to @auth_group, notice: AuthGroup.new.table_name_to_show.concat(' was successfully updated.') }
        format.json { render :show, status: :ok, location: @auth_group }
      else
        format.html { render :edit }
        format.json { render json: @auth_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_groups/1
  # DELETE /auth_groups/1.json
  def destroy
    @auth_group.destroy
    respond_to do |format|
      format.html { redirect_to auth_groups_url, notice: AuthGroup.new.table_name_to_show.concat(' was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_group
      @auth_group = AuthGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_group_params
      params.require(:auth_group).permit(:name, :odt, :gg, :inversion, :employee, :retencione, :pool, :razon_social, :auth_group)
    end
end
