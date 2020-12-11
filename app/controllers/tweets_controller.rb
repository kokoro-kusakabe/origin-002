class TweetsController < ApplicationController

  include CommonActions
  before_action :authenticate_user!, except: [:index, :show, :new_guest]
  before_action :set_action, only: [:edit, :update, :show]
  before_action :set_categories

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.nickname = "guest"
    end
    sign_in user
    redirect_to root_path
  end

  def index
    @tweet = Tweet.includes(:user).limit(6).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
  end
  

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path
    else 
      render :edit
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :text, :image, category_ids: []).merge(user_id: current_user.id)
  end

  def set_action
    @tweet = Tweet.find(params[:id])
  end

end
