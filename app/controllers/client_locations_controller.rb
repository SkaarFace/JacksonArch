class ClientLocationsController < ApplicationController
  before_action :set_client_location, only: [:show, :edit, :update, :destroy]
  before_filter :find_client
  respond_to :html, :xml, :json

  # GET /client_locations
  # GET /client_locations.json
  def index
    @client_locations = @client.client_locations
  end

  # GET /client_locations/1
  # GET /client_locations/1.json
  def show
    @client_location = @client.client_locations.find(params[:id])
  end

  # GET /client_locations/new
  def new
    @client_location = @client.client_locations.build
    respond_with(@client_location)
  end

  # GET /client_locations/1/edit
  def edit
    @client_location = @client.client_locations.find(params[:id])
  end

  # POST /client_locations
  # POST /client_locations.json
  def create
    @client_location = @client.client_locations.create(client_location_params)

    respond_to do |format|
      if @client_location.save
        format.html { redirect_to([@client_location.client, @client_location], notice: 'Client location was successfully created.') }
        format.json { render action: 'show', status: :created, location: @client_location }
      else
        format.html { render action: 'new' }
        format.json { render json: @client_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_locations/1
  # PATCH/PUT /client_locations/1.json
  def update
    @client_location = @client.client_locations.find(params[:id])
    respond_to do |format|
      if @client_location.update(client_location_params)
        format.html { redirect_to([@client_location.client, @client_location], notice: 'Client location was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_locations/1
  # DELETE /client_locations/1.json
  def destroy
    @client_location = @client.client_locations.find(params[:id])
    @client_location.destroy
    respond_to do |format|
      format.html { redirect_to client_client_locations_url }
      format.json { head :no_content }
    end
  end

  private

    def find_client
      @client = Client.find(params[:client_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_client_location
      @client_location = ClientLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_location_params
      params.require(:client_location).permit(:address_line_1, :address_line_2, 
        :zip_code, :state, :city, :latitude, :longitude, :job_id)    
    end
end
