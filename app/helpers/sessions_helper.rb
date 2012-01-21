module SessionsHelper

  def sign_in(employee)
    cookies.permanent.signed[:remember_token] = [employee.id, employee.password_digest]
    self.current_employee = employee
  end

  def current_employee=(employee)
    @current_employee = employee
  end

  def current_employee
    @current_employee ||= employee_from_remember_token
  end

  def signed_in?
    !current_employee.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_employee = nil
  end

  def current_employee?(employee)
    employee == current_employee
  end

  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  private

  def employee_from_remember_token
    Employee.authenticate_with_password_diges(*remember_token)
  end

  def remember_token
    cookies.signed[:remember_token] || [nil, nil]
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end
end
