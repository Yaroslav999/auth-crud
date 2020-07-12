# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_employee, only: %i[show edit update destroy]

  def index
    @q = Employee.ransack(params[:q])
    @employees = @q.result(distinct: true).page params[:page]
  end

  def new
    @employee = Employee.new
  end

  def edit; end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path
    else
      render 'new'
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render 'edit'
    end
  end

  def destroy
    @employee.destroy

    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :department_id, :active)
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end
end
