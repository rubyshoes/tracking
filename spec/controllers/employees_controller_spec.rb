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
      response.should have_selector("title", :content => @employee.first_name)
    end

    it "should include the employee's name" do
      get :show, :id => @employee
      response.should have_selector("h1", :content => @employee.first_name)
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

end
