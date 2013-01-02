class ClientsController < ApplicationController

  def index 
    @clients = Client.paginate(page: params[:page])
  end

  def show
    @client = Client.find(params[:id])
  end

  def client_list
     @clients = Client.order(:name).where("name like ?", "%#{params[:term]}%")
     render json: @clients.map(&:name)
  end

  def get_client_data # This action is used to retrieve the client details after a client has been selected in an autocomplete drop-down.
    # raise params[:label]
    client_name = params[:label] # Set client_name for purposes of readability. Could otherwise add the param right into the next query line
    @client_data = Client.where("name like ?", client_name)
    render json: @client_data.first # 'where' clause return an ActiveRecord Association collection object. It is necessary to call the query and call the first object from the collection to have access to the actual object.
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
