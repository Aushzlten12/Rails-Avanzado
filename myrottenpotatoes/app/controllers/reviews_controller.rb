class ReviewsController < ApplicationController
  before_action :has_moviegoer_and_movie 
  before_action :set_review, :only => [:edit, :update]
  before_action :user_is_current, :only => [:edit,:update]
  protected
  def has_moviegoer_and_movie
    unless @current_user
      flash[:warning] = 'You must be logged in to create a review.'
      redirect_to login_path
    end
    unless (@movie = Movie.find(params[:movie_id]))
      flash[:warning] = 'Review must be for an existing movie.'
      redirect_to movies_path
    end
  end

  public
  def new
    @review = @movie.reviews.build
  end  

  def create
    potatoes_value = params[:review][:potatoes]
    @current_user.reviews << @movie.reviews.build(potatoes: potatoes_value)
    redirect_to movie_path(@movie)
  end

  def edit
  end

  def update 
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
    potatoes_value_update = params[:review][:potatoes]
    @review.update(:potatoes => potatoes_value_update)
    redirect_to movie_path(@movie)
  end

  private 

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def user_is_current
    unless @review.moviegoer == @current_user
      flash[:warning] = 'You are not authorized to edit this review.'
      redirect_to movie_path(@movie)
    end
  end
end