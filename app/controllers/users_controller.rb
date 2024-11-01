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

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.includes(:breed).page(params[:page]).per(5)  # Display 5 comments per page

    # Fetch unique breeds the user has commented on
    @unique_breeds = @user.comments.joins(:breed).select("breeds.*").distinct
  end

  def map
    # Retrieve all users with latitude and longitude
    @users = User.where.not(latitude: nil, longitude: nil)
  end
end
