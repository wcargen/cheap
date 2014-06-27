class ItemsController < ApplicationController

  def index
  end

  def show
    @food = params[:food]
    @postal_code = params[:postal_code]
    @price__lte = params[:price__lte]

    request = Typhoeus::Request.new(
      "http://api.locu.com/v1_0/menu_item/search/?",
      params: {name: @food, postal_code: @postal_code, price__lte: @price__lte,
               api_key: Rails.application.secrets.locu_api_key}).run
      @result = JSON.parse(request.body)
  end

  def info
    @venueid = params[:venueid]

    request = Typhoeus::Request.new(
      "http://api.locu.com/v1_0/venue/#{@venueid}/?",
      params: {api_key: Rails.application.secrets.locu_api_key}).run
      @info = JSON.parse(request.body)
  end

  def create
  end

  def destroy
  end
end
