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
      response.should have_selector("h3", :content => @employee.emp_full_name)
    end

    it "should have a profile image" do
      get :show, :id => @employee
    response.should have_selector("h3>img", :class => "gravatar")
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Time and it's Cost")
    end

    it "should have a first_name field of type text" do
      get :new
      response.should have_selector("input[name='employee[first_name]'][type='text']")
    end

    it "should have a 'mi' field" do
      get :new
      response.should have_selector("input[name='employee[mi]'][type='text']")
    end

    it "should have a 'last_name' field" do
      get :new
      response.should have_selector("input[name='employee[last_name]'][type='text']")
    end

    it "should have a 'marital_status' field" do
      get :new
      response.should have_selector("input[name='employee[marital_status]'][type='text']")
    end

    it "should have a 'gender' field" do
      get :new
      response.should have_selector("input[name='employee[gender]'][type='text']")
    end

    it "should have a 'birth_date' field" do
      get :new
      response.should have_selector("input[name='employee[birth_date]'][type='text']")
    end

    it "should have a 'hire_date' field" do
      get :new
      response.should have_selector("input[name='employee[hire_date]'][type='text']")
    end

    it "should have a 'term_date' field" do
      get :new
      response.should have_selector("input[name='employee[term_date]'][type='text']")
    end

    it "should have a 'primary_position' field" do
      get :new
      response.should have_selector("input[name='employee[primary_position]'][type='text']")
    end

    it "should have a 'trained_position' field" do
      get :new
      response.should have_selector("input[name='employee[trained_position]'][type='text']")
    end

    it "should have a 'email' field" do
      get :new
      response.should have_selector("input[name='employee[email]'][type='text']")
    end

    it "should have a 'active' field" do
      get :new
      response.should have_selector("input[name='employee[active]'][type='checkbox']")
    end

    it "should have a 'address1' field" do
      get :new
      response.should have_selector("input[name='employee[address1]'][type='text']")
    end

    it "should have a 'address2' field" do
      get :new
      response.should have_selector("input[name='employee[address2]'][type='text']")
    end

    it "should have a 'city' field" do
      get :new
      response.should have_selector("input[name='employee[city]'][type='text']")
    end

    it "should have a 'zip_code' field" do
      get :new
      response.should have_selector("input[name='employee[zip_code]'][type='text']")
    end

    it "should have a 'state' field" do
      get :new
      response.should have_selector("input[name='employee[state]'][type='text']")
    end

    it "should have a 'emp_home_ph' field" do
      get :new
      response.should have_selector("input[name='employee[emp_home_ph]'][type='text']")
    end

    it "should have a 'emp_mobile_ph' field" do
      get :new
      response.should have_selector("input[name='employee[emp_mobile_ph]'][type='text']")
    end

    it "should have a 'emer_contact_first_name' field" do
      get :new
      response.should have_selector("input[name='employee[emer_contact_first_name]'][type='text']")
    end

    it "should have a 'emer_contact_last_name' field" do
      get :new
      response.should have_selector("input[name='employee[emer_contact_last_name]'][type='text']")
    end

    it "should have a 'emer_contact_relationship' field" do
      get :new
      response.should have_selector("input[name='employee[emer_contact_relationship]'][type='text']")
    end

    it "should have a 'emer_contact_ph' field" do
      get :new
      response.should have_selector("input[name='employee[emer_contact_ph]'][type='text']")
    end

    it "should have a 'role' field" do
      get :new
      response.should have_selector("input[name='employee[role]'][type='text']")
    end

    it "should have a password field of type password" do
      get :new
      response.should have_selector("input[name='employee[password]'][type='password']")
    end

    it "should have a 'password_confirmation' field" do
      get :new
      response.should have_selector("input[name='employee[password_confirmation]'][type='password']")
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
          response.should_not change(Employee, :count)
          end
        end

        it "should have the right title" do
          post :create, :employee => @attr
          response.should have_selector("title", :content => "Time and it's Cost")
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
          response.should change(Employee, :count).by(1)
        end
      end

      it "should redirect to the employee show page" do
        post :create, :employee => @attr
        response.should redirect_to(employee_path(assigns(:employee)))
      end

      it "should have a 'New Employee has been saved' message" do
        post :create, :employee => @attr
        flash[:success].should =~ /New Employee has been saved/i
      end
    end
  end
end
