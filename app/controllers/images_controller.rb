class ImagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :except => [:create, :update]

  def index
    @user = current_user
  end

  def show
    @user = current_user
    @img = Image.find(params[:id]) if params[:id]
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

  def update
    @img = Image.find(params[:id]) if params[:id]
    lat = params[:lat]
    lon = params[:lon]
    ip = params[:ip]
    event = Event.create(image: @img, ip: ip, latitude: lat, longitude: lon)
    event.save
    render :json => { :status => "success" }
  rescue
    render :json => { :status => "error" }
  end

  private
  def image_params
      params.require(:image).permit(:image)
  end
end
