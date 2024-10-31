class BreedsController < ApplicationController
  def index
    # Start with all breeds
    @breeds = Breed.left_joins(:comments)
                   .group(:id)
                   .select("breeds.*, COUNT(comments.id) AS comments_count")

    # Apply search filter if a term is provided
    if params[:search].present?
      @breeds = @breeds.where("breeds.name LIKE ? OR breeds.sub_breed LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    # Apply hierarchical filters if selected
    @breeds = @breeds.where(group: params[:group]) if params[:group].present?
    @breeds = @breeds.where(size: params[:size]) if params[:size].present?
    @breeds = @breeds.where(purpose: params[:purpose]) if params[:purpose].present?

    # Paginate results
    @breeds = @breeds.page(params[:page]).per(10) # Display 10 breeds per page

    # For filtering options in the view
    @groups = Breed.distinct.pluck(:group)
    @sizes = Breed.distinct.pluck(:size)
    @purposes = Breed.distinct.pluck(:purpose)
  end

  def show
    @breed = Breed.find(params[:id])
    @comments = @breed.comments.page(params[:page]).per(5)  # Paginate comments, 5 per page
  end

  def alphabet
    # Get the letter from params and filter breeds by the first letter of the name
    letter = params[:letter]
    @breeds = Breed.where("name LIKE ?", "#{letter}%")
                   .left_joins(:comments)
                   .group(:id)
                   .select("breeds.*, COUNT(comments.id) AS comments_count")
                   .order(:name)
                   .page(params[:page])
                   .per(10)

    # Render the index view for consistency
    render :index
  end
end
