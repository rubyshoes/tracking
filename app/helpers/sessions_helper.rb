module SessionsHelper

  def sign_in(employee)
    cookies.permanent[:remember_token] = employee.remember_token
    current_employee = employee
  end

  def current_employee=(employee)
    @current_employee = employee
  end

  def current_employee
    @current_employee ||= employee_from_remember_token
  end

  def current_employee?(employee)
    employee == current_employee
  end

  def signed_in?
    !current_employee.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def store_location
    session[:return_to] = request.fullpath
  end


  private

    def employee_from_remember_token
      remember_token = cookies[:remember_token]
      Employee.find_by_remember_token(remember_token) unless remember_token.nil?
    end

    def clear_return_to
      session.delete(:return_to)
    end
end
