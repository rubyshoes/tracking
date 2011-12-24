require 'spec_helper'

describe EmployeesController do
  render_views

  describe "GET 'show'" do

    before(:each) do
      @employee = Factory(:employee)
    end

    it "should be successful" do
      get :show, :id => @employee
      response.should be_success
    end

    it "should find the right employee" do
      get :show, :id => @employee
      assigns(:employee).should == @employee
    end

    it "should have the right title" do
      get :show, :id => @employee
      response.should have_selector("title", :content => @employee.emp_full_name)
    end

    it "should include the employee's name" do
      get :show, :id => @employee
      response.should have_selector("h1", :content => @employee.emp_full_name)
    end

    it "should have a profile image" do
      get :show, :id => @employee
    response.should have_selector("h1>img", :class => "gravatar")
    end
  end


  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Register")
    end
  end

  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @attr = { :first_name => "",
          :last_name => "",
          :mi => "",
          :marital_status => "",
          :gender => "",
          :birth_date => '',
          :hire_date => '',
          :term_date => "",
          :active => "",
          :primary_position => "",
          :trained_position => "",
	        :role => "",
          :email => "",
          :address1 => "",
          :address2 => "",
          :city => "",
          :zip_code => "",
          :state => "",
          :emp_home_ph => "",
          :emp_mobile_ph => "",
          :emer_contact_first_name => "",
          :emer_contact_last_name => "",
          :emer_contact_relationship => "",
          :emer_contact_ph => "",
          :password => "",
          :password_confirmation => ""
        }
      end

        it "should not create an employee" do
          lambda do
          post :create, :employee => @attr
          end.should_not change(Employee, :count)
        end

        it "should have the right title" do
          post :create, :employee => @attr
          response.should have_selector("title", :content => "Register")
        end

        it "should render the 'new' page" do
          post :create, :employee => @attr
          response.should render_template('new')
        end
      end

    describe "success" do

      before(:each) do
        @attr = { :first_name => "Teress",
          :last_name => "Pottle",
          :mi => "null",
          :marital_status => "Single",
          :gender => "Female",
          :birth_date => '1979-09-21',
          :hire_date => '2002-01-01',
          :term_date => "null",
          :active => "true",
          :primary_position => "Team Leader",
          :trained_position => "Job Development",
	        :role => "Manager",
          :email => "tpottle@example.com",
          :address1 => "1 First Ave",
          :address2 => "null",
          :city => "Frave",
          :zip_code => "54806",
          :state => "WI",
          :emp_home_ph => "1-111-111-1111",
          :emp_mobile_ph => "1-222-222-2222",
          :emer_contact_first_name => "Elsine",
          :emer_contact_last_name => "Pottle",
          :emer_contact_relationship => "Sister",
          :emer_contact_ph => "1-333-333-3333",
          :password => "foobar",
          :password_confirmation => "foobar"
        }
      end

      it "should create an employee" do
        lambda do
          post :create, :employee => @attr
        end.should change(Employee, :count).by(1)
      end

      it "should redirect to the employee show page" do
        post :create, :employee => @attr
        response.should redirect_to(employee_path(assigns(:employee)))
      end
    end
  end
end
