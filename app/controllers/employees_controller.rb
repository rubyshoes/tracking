class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
    @title = @employee.emp_full_name
  end

  def new
    @employee = Employee.new
    @title = "Add a New Employee"
  end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      flash[:success] = "Employee has been Successfully Saved."
      redirect_to @employee
    else
      @title = "You have some errors"
      @employee.password = ""
      @employee.password_confirmation = ""
      render 'new'
    end
  end
end
