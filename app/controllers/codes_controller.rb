class CodesController < ApplicationController

  def index
    @codes = Code.paginate(page: params[:page])
  end

  def show
    @code = Code.find(params[:id])
  end

  def new
    @code = Code.new
    @code.codelines.build(:units_alloc => params[:units_alloc], :code => @code)
    @code.contracts.build
#    @code.clients.build
#    @code = @code.codelines.build(params[:code])
#    debugger
#    @code = Code.find(params[:code_id])
  end

  def create
 #   raise params[:code].to_s
 #    @code = Code.new(params[:code])
     @code = Code.new(params[:code])
 #    @code = Code.find(params[:code_id])
 #    @code.codelines.build(:units_alloc => params[:units_alloc], :code => @code)
    if @code.save
      flash[:success] = "New Code has been saved"
      redirect_to @code # this redirects to the contract show page
    else
      @title = "You have some errors"
      render 'new'
    end
  end

  def edit
    @code = Code.find(param[:id])
  end

  def update
    if @code.update_attributes(params[:code])
       flash[:success] = "Code Profile updated"
       redirect_to @code
    else
       render 'edit'
    end
  end
end
