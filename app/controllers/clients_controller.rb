class ClientsController < ApplicationController

  def index # If you need an index view for viewing all clients, you will want to move this logic into a different action and modify the data source in the form view files
    @clients = Client.order(:name).where("name like ?", "%#{params[:term]}%") # This line uses an AR query to using the jQuery UI autocomplete's "term" parameter. See jQuery UI documentation
    render json: @clients.map(&:name) # This line returns an array of clients from the query
  end

  def show
    @client = Client.find(params[:id])
  end
  
  def get_client_data # This action is used to retrieve the code details after a code has been selected in an autocomplete drop-down.
    # raise params[:label]
    client_name = params[:label] # Set client_name for purposes of readability. Could otherwise add the param right into the next query line
    @client_data = Client.where("name like ?", client_name)
    render json: @client_data.first # where clauses return an ActiveRecord Association collection object. It is necessary to call the query and call the first object from the collection to have access to the actual object.
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
