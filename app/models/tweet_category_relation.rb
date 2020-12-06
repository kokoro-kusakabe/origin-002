class TweetCategoryRelation < ApplicationRecord

  belongs_to :tweet
  belongs_to :category
  
end
