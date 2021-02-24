class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pets_params)
    @pet.user = current_user

    if @pet.save
      redirect_to pet_path(@pet.id)
    else
      render :new
    end
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pets_params)

    if @pet.save
      redirect_to pet_path(@pet.id)
    else
      render :show
    end
  end

  def pets_params
    params.require(:pet).permit(:animal_type, :name, :age, :description)
  end
end
