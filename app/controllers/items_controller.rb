class ItemsController < ApplicationController

  def index
  end

  def show
    @food = params[:food]
    @postal_code = params[:postal_code]
    @price__lte = params[:price__lte]

    request = Typhoeus::Request.new(
      "http://api.locu.com/v1_0/menu_item/search/?",
      params: { name: @food, postal_code: @postal_code, price__lte: @price__lte,
               api_key: ENV['LOCU_API_KEY'] }).run
      @result = JSON.parse(request.body)
  end

  def info
    @venueid = params[:venueid]

    request = Typhoeus::Request.new(
      "http://api.locu.com/v1_0/venue/#{@venueid}/?",
      params: { api_key: ENV['LOCU_API_KEY'] }).run
      @info = JSON.parse(request.body)
  end

  #Adds favorite item from search results to user's Favorites list
  def create
    current_user.items.create(
      name: params[:name],
      price: params[:price],
      venue: params[:venue])
    redirect_to current_user
  end

  def destroy
  end

  private

    def item_params
      params.require(:item).permit(:item_id, :user_id, :name, :price, :venue)
    end
end
