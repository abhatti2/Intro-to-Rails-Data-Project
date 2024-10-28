class UsersController < ApplicationController
  def index
    if params[:search].present? && !params[:search].empty?
      # Search by name or email, ensuring no null search
      @users = User.where("name LIKE ? OR email LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @users = User.all
    end
  end
end
