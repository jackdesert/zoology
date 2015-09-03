class ZoosController < ApplicationController
  before_action :set_zoo, only: [:show, :edit, :update, :destroy]

  # GET /zoos
  # GET /zoos.json
  def index
    @zoos = Zoo.all
  end

  # GET /zoos/1
  # GET /zoos/1.json
  def show
  end

  # GET /zoos/new
  def new
    @zoo = Zoo.new
  end

  # GET /zoos/1/edit
  def edit
  end

  # POST /zoos
  # POST /zoos.json
  def create
    @zoo = Zoo.new(zoo_params)

    respond_to do |format|
      if @zoo.save
        format.html { redirect_to @zoo, notice: 'Zoo was successfully created.' }
        format.json { render :show, status: :created, location: @zoo }
      else
        format.html { render :new }
        format.json { render json: @zoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zoos/1
  # PATCH/PUT /zoos/1.json
  def update
    respond_to do |format|
      if @zoo.update(zoo_params)
        format.html { redirect_to @zoo, notice: 'Zoo was successfully updated.' }
        format.json { render :show, status: :ok, location: @zoo }
      else
        format.html { render :edit }
        format.json { render json: @zoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zoos/1
  # DELETE /zoos/1.json
  def destroy
    @zoo.destroy
    respond_to do |format|
      format.html { redirect_to zoos_url, notice: 'Zoo was successfully destroyed.' }
      format.json { head :no_content }
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
