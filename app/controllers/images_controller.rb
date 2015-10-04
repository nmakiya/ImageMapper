class ImagesController < ApplicationController
  before_filter :store_ip

  def index
    @user = current_user
  end

  def show
    @user = current_user
    @img = Image.find(params[:id]) if params[:id]
    event = Event.create(image: @img, ip: request.env['REMOTE_ADDR'])
    event.save
  end

  protected
  def store_ip
  end
end
