class SessionsController < ApplicationController

  def new
  end

  def create
    employee = Employee.find_by_email(params[:session][:email])
    if employee && employee.authenticate(params[:session][:password])
       sign_in employee
       redirect_to employee, :notice => "You have successfully signed in." 
    else
      flash.now[:error] = "Invalid email/password combination."
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
