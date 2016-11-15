class ReviewsController < ApplicationController
  before_filter :require_login



  def create

    @product = Product.find params[:product_id]
    @review = Review.new(review_params)
    @review.product_id = @product.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product)
    end

  end

  def destroy
    @product = Product.find params[:product_id]
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def review_params
      params.require(:review).permit(
        :description,
        :rating
      )
  end

  def require_login

    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path # halts request cycle
    end

  end

end


