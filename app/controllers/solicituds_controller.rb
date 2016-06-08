class SolicitudsController < ApplicationController
  before_action :set_solicitud, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :log_in?, only: [:index]


  # GET /solicituds
  # GET /solicituds.json
  def index
    @solicituds = Solicitud.all
  end

  def log_in?
    if current_user
      redirect_to user_path
    end
  end

  # GET /solicituds/1
  # GET /solicituds/1.json
  def show
  end

  # GET /solicituds/new
  def new 
    @pet = Pet.friendly.find(params[:id])
    @solicitud = Solicitud.new
  end

  # GET /solicituds/1/edit
  def edit
  end

  # POST /solicituds
  # POST /solicituds.json
  def create
    @pet = Pet.find(params[:id])     
    @solicitud = Solicitud.new(solicitud_params)
    @solicitud.id = current_user.id        
    @solicitud.id_pet = @pet.id
    respond_to do |format|
      if @solicitud.save
        solicitud = Solicitud.find(@solicitud.id)
        user = User.find(current_user.id)
        #user.follow(solicitud) Esto no porque crea tuplas duplicadas y mal en followers
        format.html { redirect_to @solicitud, notice: 'Tu solicitud ha sido guardada' }
        format.json { render :show, status: :created, location: @solicitud }
      else
        format.html { render :new }
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicituds/1
  # PATCH/PUT /solicituds/1.json
  def update
    respond_to do |format|
      if @solicitud.update(solicitud_params)
        format.html { redirect_to @solicitud, notice: 'Solicitud was successfully updated.' }
        format.json { render :show, status: :ok, location: @solicitud }
      else
        format.html { render :edit }
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicituds/1
  # DELETE /solicituds/1.json
  def destroy
    @solicitud.destroy
    respond_to do |format|
      format.html { redirect_to solicituds_url, notice: 'Solicitud was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud
      @solicitud = Solicitud.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicitud_params
      params.require(:solicitud).permit(:nombre, :ocupacion, :edad, :por_que, :consideras, :experiencia, :actividades, :gastos, :vivienda, :dormir, :mudarse, :ajuste)
    end
end
