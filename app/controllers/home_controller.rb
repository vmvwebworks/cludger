class HomeController < ApplicationController
  def index
    @countries = Country.all

  end
  # def users
  #   render :json => User.all
  # end
end
