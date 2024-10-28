class UsersController < ApplicationController
  def index
    if params[:search].present? && !params[:search].empty?
      # Search by name or email
      @users = User.where("name LIKE ? OR email LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
                   .page(params[:page])  # Add pagination here
                   .per(10)  # Display 10 users per page
    else
      # Display all users with pagination
      @users = User.page(params[:page])  # Add pagination here
                   .per(10)  # Display 10 users per page
    end
  end
end
