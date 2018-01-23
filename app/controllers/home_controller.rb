class HomeController < ApplicationController
  def index
    User.reindex
    @filteredUsers = User.search(params[:userFilter], fields: [:name, :country, :email], match: :word_start)

    @countries = Country.all

  end
  # def users
  #   render :json => User.all
  # end
end
