class EmployeesController < ApplicationController
  before_filter :signed_in_employee, only: [:index, :edit, :update]
  before_filter :correct_employee,   only: [:edit, :update]

  def index
    @employees = Employee.paginate(page: params[:page])
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      sign_in @employee
      flash[:success] = "New Employee has been saved"
      redirect_to @employee # this redirects to the employee show page
    else
      @title = "You have some errors"
      @employee.password.clear
      @employee.password_confirmation.clear
      render 'new'
    end
  end

  def edit
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
      sign_in @employee
      flash[:success] = "Employee Profile updated"
      redirect_to @employee
    else
      render 'edit'
    end
  end

  private

    def signed_in_employee
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in to access this page."
      end
    end

    def correct_employee
      @employee = Employee.find(params[:id]) # if it is the current user they
                                             # end up at the edit action. That
                                             # is why we do not need this line
                                             # in the edit action above.
                                             # Essentially we are pulling an 
                                             # existing user from the database.
      redirect_to(root_path) unless current_employee?(@employee)
    end

    def admin_employee
      redirect_to(root_path) unless current_employee.admin?
    end
end
