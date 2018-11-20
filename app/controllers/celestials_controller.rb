class CelestialsController < ApplicationController
  def new
    @celestial = Celestial.new
  end

  def create
    @celestial = Celestial.new(celestial_params)
    puts @celestial.errors.full_messages
    @celestial.user = current_user
    if @celestial.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @celestial = Celestial.find(params[:id])
  end

  def update
    @celestial = Celestial.find(params[:id])
    if @celestial.update(celestial_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def celestial_params
    params.require(:celestial).permit(:photo, :name, :price, :category, :location)
  end
end
