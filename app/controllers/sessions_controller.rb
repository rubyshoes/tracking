class SessionsController < ApplicationController
  
#  skip_before_filter :session_expiry
#  skip_before_filter :update_activity_time

  def new
    @title = "Sign in"
  end

  def create
    employee = Employee.find_by_email(params[:email])
    if employee && employee.authenticate(params[:password])
      session[:employee_id] = employee.id
      redirect_to employee_path(@employee), :notice => "You have successfully signed in"
    else
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    end
  end

  def destroy

  end

#  def check_session_alive
#    get_session_time_left
#    if @session_time_left > 0
#      render 'sessions/check_session_alive', :layout=>false
#    else
#      sign_out
#      deny_assess 'Your session has timed out. Please sign back in.'
#    end
#  end
end
