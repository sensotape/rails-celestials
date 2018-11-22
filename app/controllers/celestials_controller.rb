class CelestialsController < ApplicationController
  before_action :set_celestial, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @celestial = Celestial.new
      save_filters
      @celestials = Celestial.where(sql_query, query: "%#{params[:query]}%")
      calculate_min_max_ave if @celestials
    else
      @celestial = Celestial.new
      save_filters
      retreive_celestials
      calculate_min_max_ave if @celestials
    end
  end

  def show
    @message = Message.new
  end

  def new
    @celestial = current_user.celestials.new
    authorize @celestial
  end

  def create
    @celestial = current_user.celestials.new(permitted_attributes(Celestial))
    authorize @celestial
    if @celestial.save
    redirect_to celestials_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @celestial.update_attributes(permitted_attributes(@celestial))
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @celestial.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_celestial
    @celestial = Celestial.find(params[:id])
    authorize @celestial
  end

  def celestial_params
    params.require(:celestial).permit(:photo, :name, :price, :category, :location)
  end

  def save_filters
    @categories = params[:category]
    @min_max = [params[:min], params[:max]] if params[:min] && params[:max]
  end

  def retreive_celestials
    @celestials = policy_scope(Celestial)
    @celestials.where!(category: params[:category]) if params[:category]
    @celestials.where!(price: params[:min]..params[:max]) if params[:min] && params[:max]
  end

  def calculate_min_max_ave
    all_prices = []
    policy_scope(Celestial).each do |celestial|
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
