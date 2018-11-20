class CelestialsController < ApplicationController
  def index
    @celestial = Celestial.new
    save_filters
    retreive_celestials
    calculate_min_max_ave if @celestials
  end

  private

  def save_filters
    @categories = params[:category]
    @min_max = [params[:min], params[:max]] if params[:min] && params[:max]
  end

  def retreive_celestials
    @celestials = Celestial.all
    @celestials.where!(category: params[:category]) if params[:category]
    @celestials.where!(price: params[:min]..params[:max]) if params[:min] && params[:max]
  end

  def calculate_min_max_ave
    all_prices = []
    Celestial.all.each do |celestial|
      all_prices << celestial.price
    end
    min_and_max = all_prices.minmax
    @min_price = min_and_max.first
    @max_price = min_and_max.last
    @ave_price = all_prices.inject { |sum, el| sum + el }.to_f / all_prices.size
    @temp_min = params[:min] || @min_price
    @temp_max = params[:max] || @max_price
  end
end
