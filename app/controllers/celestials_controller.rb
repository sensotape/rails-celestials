class CelestialsController < ApplicationController
  def index
    @celestials = Celestrial.all
  end

end
