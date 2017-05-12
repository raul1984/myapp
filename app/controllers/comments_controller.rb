class CommentsController < ApplicationController
  
  def index
   redirect_to root_path 
  end


  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Your review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        format.js
      else
        format.html { redirect_to @product, alert: 'Your review was not saved, did you remember to rate this product?' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
  end
  
  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

end

