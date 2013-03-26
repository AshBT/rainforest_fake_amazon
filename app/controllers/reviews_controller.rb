class ReviewsController < ApplicationController

  before_filter :load_product

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    # @review = Review.new(:comment => params[:review][:comment], :product_id => @product.id, :user_id => current_user.id)

    @review = @product.reviews.build(
      :comment => params[:review][:comment],
      :user_id => current_user.id
      )

    if @review.save
      redirect_to @product, notice: "Review was successfully created."
    else
        render action: "../products/show"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  def load_product
    @product = Product.find(params[:product_id])
  end

end