class HomeController < ApplicationController

  def index
    redirect_to zoos_path
  end
end
