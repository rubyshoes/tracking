class CodesController < ApplicationController

  def index
    @codes = Code.paginate(page: params[:page])
  end

  def show
    @code = Code.find(params[:id])
  end

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(params[:code])
    if @code.save
      flash[:success] = "New Code has been saved"
      redirect_to @code
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
