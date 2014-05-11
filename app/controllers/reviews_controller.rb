class ReviewsController < ApplicationController
	  before_action :set_movie

	def index
  		#@movie = Movie.find(params[:movie_id])
  		@reviews = @movie.reviews  # has_many :reviews
  		# @reviews = Reviews.find_by(movie_id: params[:movie_id])
	end

	def new
	  #@movie = Movie.find(params[:movie_id])
	  @review = @movie.reviews.new
	end

	def create
	  #@movie = Movie.find(params[:movie_id])
	  @review = @movie.reviews.new(review_params)
	  if @review.save
	    redirect_to movie_reviews_path(@movie), 
	                  notice: "Thanks for your review!"
	  else
	    render :new
	  end
	end

	private

	def review_params
	  params.require(:review).permit(:name, :comment, :stars)
	end

	def set_movie
  		@movie = Movie.find(params[:movie_id])
	end

end
