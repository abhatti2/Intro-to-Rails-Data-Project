class BreedsController < ApplicationController
  def index
    if params[:search].present?
      @breeds = Breed.left_joins(:comments)
                     .where("breeds.name LIKE ? OR breeds.sub_breed LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
                     .group(:id)
                     .select("breeds.*, COUNT(comments.id) AS comments_count")
    else
      @breeds = Breed.left_joins(:comments)
                     .group(:id)
                     .select("breeds.*, COUNT(comments.id) AS comments_count")
    end
  end
end
