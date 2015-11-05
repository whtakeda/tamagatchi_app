class WelcomeController < ApplicationController
  def index
    redirect_to tamagatchis_path if current_user
  end
end
