class CommentsController < ApplicationController

  include CommonActions
  before_action :set_categories
  
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment }
        format.js
      else
        format.html { render :new }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
