class AnimalsController < ApplicationController
  before_action :set_animal, only: [:edit, :update, :destroy]
  before_action :set_zoo

  # GET /animals
  def index
    @animals = @zoo.animals
    a = 5
  end

  # GET /animals/new
  def new
    @animal = Animal.new
    @form_path = zoo_animals_path(@zoo)
  end

  # GET /animals/1/edit
  def edit
    @form_path = zoo_animal_path(@zoo, @animal)
  end

  # POST /animals
  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @zoo, notice: 'Animal was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /animals/1
  def update

    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to @zoo, notice: 'Animal was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /animals/1
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to @zoo, notice: "#{@animal.name} was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    def set_zoo
      @zoo = Zoo.find(params[:zoo_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      hash = params.require(:animal).permit(:name, :zoo_id, :species)
      hash.merge(zoo_id: params[:zoo_id])
    end
end
