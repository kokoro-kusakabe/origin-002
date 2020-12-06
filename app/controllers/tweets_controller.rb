class TweetsController < ApplicationController

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.nickname = "guest"
    end
    sign_in user
    redirect_to root_path
  end

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :text, :image, category_ids: []).merge(user_id: current_user.id)
  end



end
