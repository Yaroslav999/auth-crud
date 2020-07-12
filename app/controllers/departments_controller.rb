# frozen_string_literal: true

class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_department, only: %i[show edit update delete]

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def edit; end

  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to departments_path
    else
      render 'new'
    end
  end

  def update
    if @department.update(department_params)
      redirect_to departments_path
    else
      render 'edit'
    end
  end

  def destroy
    @department.destroy

    redirect_to departments_path
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end

  def find_department
    @department = Department.find(params[:id])
  end
end
