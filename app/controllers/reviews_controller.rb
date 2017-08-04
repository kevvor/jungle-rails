class ReviewsController < ApplicationController

  before_filter :check_login

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product_id = params[:product_id]

    if @review.save
      puts 'this is the saved review'
      puts @review.inspect
      redirect_to :back
    else
      redirect_to :back
    end

  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to :back
  end


  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

  def check_login
    redirect_to new_session_path unless current_user
  end
end
