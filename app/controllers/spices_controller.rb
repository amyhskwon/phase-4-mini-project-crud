class SpicesController < ApplicationController
  def index
    spices = Spice.all
    render json: spices
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = Spice.find(params[:id])
    if spice
      spice.update(spice_params)
      render json: spice
    else
      spice_not_found
    end
  end

  def destroy
    spice = Spice.find(params[:id])
    if spice
      spice.destroy
      head:no_content
    else
      spice_not_found
    end
  end

  private

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def spice_not_found
    render json: {error: "Spice not found"}, status: :not_found
  end 

end
