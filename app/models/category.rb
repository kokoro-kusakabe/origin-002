class Category < ApplicationRecord

  has_many :tweet_category_relations
  has_many :tweets, through: :tweet_category_relations
  
end
