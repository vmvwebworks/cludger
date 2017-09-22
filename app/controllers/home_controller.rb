class HomeController < ApplicationController
  def index
    puts current_user.name
  end
end
