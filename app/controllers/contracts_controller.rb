class ContractsController < ApplicationController

  def index
    @contracts = Contract.paginate(page: params[:page])
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def new
    @contract = Contract.new
    @contract.build_client
    @contract.codelines.build.build_code
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
