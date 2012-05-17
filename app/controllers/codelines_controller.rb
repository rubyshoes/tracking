class CodelinesController < ApplicationController

  def index
    @codelines = Codeline.paginate(page: params[:page])
    @codelines = Codeline.all
  end

  def show
    @codeline = Codeline.find(params[:id])
  end

  def new
    @codeline = Codeline.new
    @codeline.build_code
    @codeline.build_contract
    @codeline.build_client
  end

  def create
  #  raise params[:codeline].to_s
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
    @codeline = Codeline.find(params[:id])
  end

  def update
    @codeline = Codeline.find(params[:id])
    if @codeline.update_attributes(params[:codeline])
       flash[:success] = "Codeline Profile updated"
       redirect_to @codeline
    else
       render 'edit'
    end
  end
end
