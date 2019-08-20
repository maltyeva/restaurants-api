class Api::V1::RestaurantsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_restaurant, only: [:show, :destroy, :update]


  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
    #before action
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    authorize @restaurant
    if @restaurant.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update

    if @restaurant.update(restaurant_params)
      # @restaurant.update(name: params[:restaurant][:name], address: .... )
      render :show
    else
      render_error
    end
  end

  def destroy
    # @restaurant
    @restaurant.destroy
    head :no_content
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end


  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :user_id)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end
end
