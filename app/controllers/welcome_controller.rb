class WelcomeController < ApplicationController
  def index
    session[:error_messages] = ""
    redirect_to tamagatchis_path if current_user
  end
end
