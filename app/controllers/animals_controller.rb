class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :update, :destroy, :make_adoptable,:remove_request]
  before_action :set_request, only: [:remove_request]
  # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  # GET /animals
  def index

    if params[:shelter_id] != nil
      @animals = Animal.where(:shelter_id => params[:shelter_id])
    else
      @animals = Animal.all
    end
    render json: @animals
  end

  # GET /animals/1
  def show
    render json: @animal 

  end

  # POST /animals
  def create
    @animal = Animal.new(animal_params)



    if @animal.save
      render json: @animal, status: :created, location: @animal
    else
 
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animals/1
  def update
    if @animal.update(animal_params)
      render json: @animal
    else

      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animals/1
  def destroy
    @animal.destroy

  end

  # POST /animals/1/adoptable
  def make_adoptable
    @animal.make_adoptable

    if @animal.save
      render json: @animal
    else
      p @animal.errors
      render json: @animal.errors, status: :unprocessable_entity
    end
    
  end
  
  #DELETE /animals/1/requests/1/remove
  def remove_request 
    @animal.adoption_requests.delete(@adoption_request)
    render json: @animal
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
        
        if params[:animal_id] != nil
          return @animal = Animal.find(params[:animal_id])
        end
        @animal = Animal.find(params[:id])
    end

    def set_request
      @adoption_request = AdoptionRequest.find(params[:adoption_request_id])
    end

    # Only allow a trusted parameter "white list" through.
    def animal_params
      params.require(:animal).permit(:temp_name, :medical_condition, :image_url, :status, :race, :shelter_id, :animal_id)
    end

    def record_not_found
      render json: {}, status: :not_found
    end
end
