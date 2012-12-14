class CodesController < ApplicationController

  def index # Please see commentary in clients controller. Pattern is repeated here.
    @codes = Code.paginate(page: params[:page])
  end
  
  def code_list
    @codes = Code.order(:code_name).where("code_name like ?", "%#{params[:term]}%")
    render json: @codes.map(&:code_name)
  end    

  def get_code_data
    # raise params[:label]
    code = params[:label]
    @code_data = Code.where("code_name like ?", code)
    render json: @code_data.first
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
