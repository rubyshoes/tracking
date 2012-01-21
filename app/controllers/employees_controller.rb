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
      flash[:success] = "New Employee has been saved"
      redirect_to @employee # this redirects to the employee show page
    else
      @title = "You have some errors"
      @employee.password.clear
      @employee.password_confirmation.clear
      render 'new'
    end
  end
end
