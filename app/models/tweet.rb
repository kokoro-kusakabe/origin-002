class Tweet < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :tweet_category_relations, dependent: :destroy
  has_many :categories, through: :tweet_category_relations
end
