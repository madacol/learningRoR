class EmployeesController < ApplicationController
  before_action :authenticate_user! #, except: [:index]
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    permission_denied and return  if current_user.cannot 'read_employee'
    @employees = Employee.all
    @new_employee = Employee.new
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    permission_denied and return  if current_user.cannot 'create_employee'
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_url, success: @employee.table_name_to_show.concat(' fue creado satisfactoriamente.') }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    permission_denied and return  if current_user.cannot 'update_employee'

    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employees_url, success: @employee.table_name_to_show.concat(' fue actualizado satisfactoriamente.') }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    permission_denied and return  if current_user.cannot 'destroy_employee'
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, success: @employee.table_name_to_show.concat(' fue eliminado satisfactoriamente.') }
      format.json { head :no_content }
      format.js   { render 'layouts/destroy' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:cedula, :name, :last_name, :phone_number, :email, :address, :startdate, :note)
    end
end
