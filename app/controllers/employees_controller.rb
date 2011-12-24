class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
    @title = @employee.emp_full_name
  end

  def new
    @employee = Employee.new
    @title = "Register"
  end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      redirect_to @employee
    else
      @title = "Register"
      render 'new'
    end
  end
end
