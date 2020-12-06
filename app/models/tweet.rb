class Tweet < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :category_ids, uniqueness: false
    validates :text, length: { maximum: 50 }
    validates :image, length: { maximum: 140 }
  end

  belongs_to :user
  has_one_attached :image
  has_many :tweet_category_relations, dependent: :destroy
  has_many :categories, through: :tweet_category_relations
end
