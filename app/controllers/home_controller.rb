class HomeController < ApplicationController
  def index
  end
  def images
    @user = current_user
  end
end
