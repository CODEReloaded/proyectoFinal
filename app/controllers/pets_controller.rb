class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :log_in?, only: [:index]

  # Check if exist a logged in user and redirect to user index page
  def log_in?
    if current_user
      redirect_to user_path
    end
  end

  # GET /pets
  # GET /pets.json
  def index
    @title = 'Mascotas'
    @pets = Pet.all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new(name: FFaker::Name.name, description: FFaker::Lorem.paragraph)
  end

  # GET /pets/1/edit
  def edit
  end

  def interested
    @pet = Pet.find(params[:id])
    user = User.find(current_user.id)
    user.follow(@pet)
    notice = "like exitoso"
    render :show
  end  

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.latitude = current_user.latitude
    @pet.longitude = current_user.longitude
    respond_to do |format|
      if @pet.save
        pet = Pet.find(@pet.id)
        user = User.find(current_user.id)
        user.follow(pet)
        format.html { redirect_to @pet, notice: 'Mascota fue creada exitosamente.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # Method to find pets, receive a parameter
  def search
    @user = User.find(2)
    @pets = Pet.where.not(user_id: 2).within(15, :origin=>@user)
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :age, :specie, :sex, :race, :height, :sterilization, :adpted, :description, :imagen)
    end
end
