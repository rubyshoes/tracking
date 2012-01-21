class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end

  def create
    employee = Employee.find_by_email(params[:email])
    if employee && employee.authenticate(params[:password])
      session[:employee_id] = employee.id
      redirect_to employee_path(@employee),  :notice => "You are Signed in"
    else
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    end
  end

  def destroy
  end
end
