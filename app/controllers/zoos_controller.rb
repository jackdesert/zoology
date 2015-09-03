class ZoosController < ApplicationController
  before_action :set_zoo, only: [:show, :edit, :update, :destroy]

  # GET /zoos
  def index
    @zoos = Zoo.with_species_count
  end

  # GET /zoos/1
  def show
    @animals = @zoo.animals.order(:species)
  end

  # GET /zoos/new
  def new
    @zoo = Zoo.new
  end

  # GET /zoos/1/edit
  def edit
  end

  # POST /zoos
  def create
    @zoo = Zoo.new(zoo_params)

    respond_to do |format|
      if @zoo.save
        format.html { redirect_to zoos_path, notice: 'Zoo was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /zoos/1
  def update
    respond_to do |format|
      if @zoo.update(zoo_params)
        format.html { redirect_to @zoo, notice: 'Zoo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /zoos/1
  def destroy
    @zoo.destroy
    respond_to do |format|
      format.html { redirect_to zoos_url, notice: 'Zoo was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zoo
      @zoo = Zoo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zoo_params
      params.require(:zoo).permit(:name)
    end
end
