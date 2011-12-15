class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
    @title = @employee.first_name
  end

  def new
    @title = "Register"
  end

end
