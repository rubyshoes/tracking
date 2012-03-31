class CodelinesController < ApplicationController

  def index
    @codelines = Codeline.paginate(page: params[:page])
  end

  def show
    @codeline = Codeline.find(params[:id])
  end

  def new
    @codeline = Codeline.new
    @codeline.contract = Contract.new
    @codeline.code = Code.new
    @codeline.build_code
  end

  def create
#    raise params[:codeline].to_s
    @codeline = Codeline.new(params[:codeline])
    if @codeline.save
      flash[:success] = "New Codeline has been saved"
      redirect_to @codeline # this redirects to the codeline show page
    else
      @title = "You have some errors"
      render 'new'
    end
  end

  def edit
    @codeline = Codeline.find(param[:id])
  end

  def update
    if @codeline.update_attributes(params[:codeline])
       flash[:success] = "Codeline Profile updated"
       redirect_to @codeline
    else
       render 'edit'
    end
  end
end
