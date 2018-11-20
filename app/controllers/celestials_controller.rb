class CelestialsController < ApplicationController
  def index
    @celestials = Celestial.all
    # filtering_params(params).each do |key, value|
    #   @celestials = @celestials.public_send(key, value) if value.present?
    # end
    @celestial = Celestial.new
  end

  private

  def celestial_params
    params.require(:celestial).permit(:category) if params['celestial']
  end

  def filtering_params(params)
    params.slice(:category)
  end

end
