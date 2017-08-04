class ReviewsController < ApplicationController
  def create
    @review = Review.new(params[:description])
    @review.user_id = session[:user_id]
    @review.save
    redirect_to :products
  end
end
