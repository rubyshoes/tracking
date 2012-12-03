class ClientsController < ApplicationController

  def index
    @clients = Client.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @clients.map(&:name)
  end

  def show
    @client = Client.find(params[:id])
  end
  
  def get_client_data
    # raise params[:label]
    client_name = params[:label]
    @client_data = Client.where("name like ?", client_name)
    render json: @client_data.first
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
      flash[:success] = "New Client has been saved"
      redirect_to @client
    else
      @title = "You have some errors"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @client.update_attributes(params[:client])
       flash[:success] = "Client Profile updated"
       redirect_to @client
    else
       render 'edit'
    end
  end
end
