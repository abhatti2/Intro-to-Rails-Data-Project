class BreedsController < ApplicationController
  def index
    # If there's a search term, filter breeds by name or sub_breed
    if params[:search].present?
      @breeds = Breed.left_joins(:comments)
                     .where("breeds.name LIKE ? OR breeds.sub_breed LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
                     .group(:id)
                     .select("breeds.*, COUNT(comments.id) AS comments_count")
                     .page(params[:page])
                     .per(10)  # Display 10 breeds per page
    else
      # If no search term, display all breeds with comment counts
      @breeds = Breed.left_joins(:comments)
                     .group(:id)
                     .select("breeds.*, COUNT(comments.id) AS comments_count")
                     .page(params[:page])
                     .per(10)  # Display 10 breeds per page
    end
  end

  def show
    @breed = Breed.find(params[:id])
    @comments = @breed.comments.page(params[:page]).per(5)  # Paginate comments, 5 per page
  end
end
