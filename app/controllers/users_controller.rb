class UsersController < ApplicationController
  before_action :authorize, except: [:index,:show,:create,:new]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def destroy
  end

end
