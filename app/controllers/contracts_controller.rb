class ContractsController < ApplicationController

  def index
    @contracts = Contract.paginate(page: params[:page])
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def new
    @contract = Contract.new
#    @contract.clients.build
    @contract.codes.build
#    @code = Code.new
#    @code = @contract.codes.build
#    @code.codelines.build
#    @contract.codelines.build(:units_alloc => params[:units_alloc], :contract => @contract)
#    @code.codelines.build(:units_alloc => params[:units_alloc], :contract => @contract)
    @code = @contract.codelines.build(params[:code])
#    debugger
#    @contract = Contract.find(params[:contract_id])
#    @code.codelines.build
  end

  def create
    raise params[:contract].to_s
 #    @code = Code.new(params[:code])
     @contract = Contract.new(params[:contract])
 #    @contract = Contract.find(params[:company_id])
 #    @code.codelines.build(:units_alloc => params[:units_alloc], :contract => @contract)
    if @contract.save
      flash[:success] = "New Contract has been saved"
      redirect_to @contract # this redirects to the contract show page
    else
      @title = "You have some errors"
      render 'new'
    end
  end

  def edit
    @contract = Contract.find(param[:id])
  end

  def update
    if @contract.update_attributes(params[:contract])
       flash[:success] = "Contract Profile updated"
       redirect_to @contract
    else
       render 'edit'
    end
  end
end
