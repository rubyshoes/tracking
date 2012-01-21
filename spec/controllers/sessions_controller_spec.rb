require 'spec_helper'

describe SessionsController do
  render_views

  describe "GET 'new'" do

    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "Sign in")
    end
  end

  describe "POST 'create'" do

    describe "invalid signin" do

      before(:each) do
        @attr = { :email => "email@example.com", :password => "invalid" }
      end

      it "should re-render the new page" do
        post  :create,  :session  =>  @attr
        response.should render_template('new')
      end

      it "should have the right title" do
        post  :create,  :session  =>  @attr
        response.should have_selector("title",  :content  => "Sign in")
      end

      it "should have a flash.now message" do
        post  :create,  :session  =>  @attr
        flash.now[:error].should =~/invalid/i
      end
    end

    describe "with valid email and password" do

      before(:each) do
        @employee = Factory(:employee)
        @attr = { :email  =>  @employee.email, :password  =>  @employee.password }
      end

 #     it "should sign the employee in" do
 #       post  :create,  :session  =>  @attr
 #       controller.current_employee.should == @employee
 #       controller.should be_signed_in
 #     end

      it "should redirect to the employee show page" do
        post  :create,  :session  =>  @attr
        response.should redirect_to(employee_path(@employee))
      end
    end
  end
end
