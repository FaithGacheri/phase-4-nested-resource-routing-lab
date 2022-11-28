class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end

  def create
    user = User.create!(user_params)
  end

  private
  def render_not_found_response
    render json: { error: "User not found" }, status: :not_found
  end

  def user_params
    params.permit(:username, :city)
  end
end
