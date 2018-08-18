class AdoptionRequestsController < ApplicationController
  before_action :set_adoption_request, only: [:show, :update, :destroy]

  # GET /adoption_requests
  def index
    @adoption_requests = AdoptionRequest.all

    render json: @adoption_requests
  end

  # GET /adoption_requests/1
  def show
    render json: @adoption_request
  end

  # POST /adoption_requests
  def create
    @adoption_request = AdoptionRequest.new(adoption_request_params)

    if @adoption_request.save
      render json: @adoption_request, status: :created, location: @adoption_request
    else
      render json: @adoption_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /adoption_requests/1
  def update
    if @adoption_request.update(adoption_request_params)
      render json: @adoption_request
    else
      render json: @adoption_request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /adoption_requests/1
  def destroy
    @adoption_request.destroy
  end

  # GET /shelters/1/adoption_requests
  def get_shelter_requests

    @animals = Animal.where(:shelter_id => params[:id])

    @adoption_requests = AdoptionRequest.joins(:user, :animal).where(:animal_id => @animals)



    render json: @adoption_requests


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption_request
      @adoption_request = AdoptionRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def adoption_request_params
      params.require(:adoption_request).permit(:user_id, :animal_id)
    end
end
