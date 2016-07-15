class EmployeeGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee_group, only: [:show, :edit, :update, :destroy]

  # GET /employee_groups
  # GET /employee_groups.json
  def index
    @employee_groups = EmployeeGroup.all
  end

  # GET /employee_groups/1
  # GET /employee_groups/1.json
  def show
  end

  # GET /employee_groups/new
  def new
    @employee_group = EmployeeGroup.new
  end

  # GET /employee_groups/1/edit
  def edit
  end

  # POST /employee_groups
  # POST /employee_groups.json
  def create
    @employee_group = EmployeeGroup.new(employee_group_params)

    respond_to do |format|
      if @employee_group.save
        format.html { redirect_to @employee_group, notice: 'Employee group was successfully created.' }
        format.json { render :show, status: :created, location: @employee_group }
      else
        format.html { render :new }
        format.json { render json: @employee_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_groups/1
  # PATCH/PUT /employee_groups/1.json
  def update
    respond_to do |format|
      if @employee_group.update(employee_group_params)
        format.html { redirect_to @employee_group, notice: 'Employee group was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_group }
      else
        format.html { render :edit }
        format.json { render json: @employee_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_groups/1
  # DELETE /employee_groups/1.json
  def destroy
    @employee_group.destroy
    respond_to do |format|
      format.html { redirect_to employee_groups_url, notice: 'Employee group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_group
      @employee_group = EmployeeGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_group_params
      params.require(:employee_group).permit(:employee_id, :auth_group_id)
    end
end
