class ContractsController < ApplicationController

  # I moved most of the functionality to the contracts controller, given that it is the business
  # entity we are focused on. 

  def index
    @contracts = Contract.paginate(page: params[:page])
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def new
    @contract = Contract.new
    @contract.build_client
    @contract.codelines.build.build_code  # Check ActiveRecord Association documentation for build methods. This 
                                          # method chain builds the codeline first, then builds the code based on the
                                          # codeline object. The difference in .build vs build_ syntax is based on the
                                          # differing association type (belongs_to vs has_many)
  end

  def create
    @contract = Contract.new(params[:contract])
    if @contract.save
      flash[:success] = "New Contract has been saved"
      redirect_to @contract
    else
      @title = "You have some errors"
      render 'new'
    end
  end

  def edit
    @contract = Contract.find(params[:id])
  end

  def update
    @contract = Contract.find(params[:id])
    if @contract.update_attributes(params[:contract])
       flash[:success] = "Contract Profile updated"
       redirect_to @contract
    else
       render 'edit'
    end
  end
end
