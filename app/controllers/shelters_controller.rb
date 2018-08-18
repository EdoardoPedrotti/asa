class SheltersController < ApplicationController
  before_action :set_shelter, only: [:show, :update, :destroy, :remove_animal]
  before_action :set_animal, only: [:remove_animal]

  # GET /shelters
  def index
    @shelters = Shelter.all

    render json: @shelters
  end

  # GET /shelters/1
  def show
    render json: @shelter
  end

  # POST /shelters
  def create
    @shelter = Shelter.new(shelter_params)

    if @shelter.save
      render json: @shelter, status: :created, location: @shelter
    else
      render json: @shelter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shelters/1
  def update
   if @shelter.update(shelter_params)
      render json: @shelter
    else
      render json: @shelter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shelters/1
  def destroy
    @shelter.destroy
  end

  # DELETE /shelters/1/animals/1/remove
  def remove_animal
    p "asdasdasdasdasdasdasda8sd979asd"
    p @animal 
    @shelter.animals.delete(@animal)
    render json: @shelter
    # if @shelter.save
    #   render json: @shelter
    # else
    #   render json: @shelter.errors, status: :unprocessable_entity
    # end
  end
  
  # GET /shelters/1/animals
  def get_animals
    p @shelter.animals
    render json: @shelter.animals
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelter
      if params[:shelter_id] != nil
        return @shelter = Shelter.find(params[:shelter_id])
      end
      @shelter = Shelter.find(params[:id])
    end

    def set_animal
      p params
      @animal = Animal.find(params[:animal_id])
    end

    # Only allow a trusted parameter "white list" through.
    def shelter_params
      params.require(:shelter).permit(:name, :location, :animal_id, :shelter_id)
    end
end
