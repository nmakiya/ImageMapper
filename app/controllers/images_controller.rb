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
    gon.events = @img.events
  end
  
  def create
    @user = current_user
    @img = Image.create( image_params )
    @img.user = @user
    @img.save
    flash[:notice] = "Image uploaded successfully!"
    redirect_to "/images"
  end

  protected
  def store_ip
  end

  private
  def image_params
      params.require(:image).permit(:image)
  end
end
