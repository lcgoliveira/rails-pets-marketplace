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
      unless @pet.photo.attached?
        @pet.photo.attach(io: open('app/assets/images/default pet photo.jpg'), filename: 'nes.png', content_type: 'image/jpg')
      end
      redirect_to pet_path(@pet.id)
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pets_params)

    if @pet.save
      redirect_to pet_path(@pet.id)
    else
      render :edit
    end
  end

  def pets_params
    params.require(:pet).permit(:animal_type, :name, :age, :description, :photo)
  end
end
