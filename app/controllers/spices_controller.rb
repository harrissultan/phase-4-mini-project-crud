class SpicesController < ApplicationController
    wrap_parameters format:[]

  def index
    spices = Spice.all
    render json: spices
  end

  # GET /spices/:id
  def show
    spice = Spice.find_by(id: params[:id])
    if spice
      render json: spice
    else
      render json: { error: "spice not found" }, status: :not_found
    end
  end

  # POST /spices
  def create
    spice = Spice.create(params.permit(:title, :image, :description, :notes, :rating))
    render json: spice, status: :created
  end

  def update
    spice = Spice.find_by(id: params[:id])
    if spice
        spice.update(params.permit(:title, :image, :description, :notes, :rating))
    else
      render json: { error: "spice not found" }, status: :not_found
    end
  end

  def destroy
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.destroy
      head :no_content
    else
      render json: { error: "Spice not found" }, status: :not_found
    end
  end
end
