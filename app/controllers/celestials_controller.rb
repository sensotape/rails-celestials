class CelestialsController < ApplicationController
  def index
    @celestial = Celestial.new
    if params[:category]
      @celestials = Celestial.where(category: params[:category])
    else
      @celestials = Celestial.all
    end
  end

  private

  def celestial_params
    params.require(:celestial).permit(:category)
  end

end
