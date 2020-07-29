# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @current_user = current_user
  end

  def update
    if current_user.update(current_user_params)
      @current_user = current_user
    else
      render json: current_user.errors, status: :bad_request
    end
  end

  private

  def current_user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
