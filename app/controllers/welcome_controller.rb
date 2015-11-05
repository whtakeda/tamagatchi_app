class WelcomeController < ApplicationController
  def index
    session[:user_id]=nil
    redirect_to tamagatchis_path if current_user
  end
end
