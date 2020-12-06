class CreateCreateTweetCategoryRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :create_tweet_category_relations do |t|
      t.references :tweet,   foreign_key: true
      t.references :category,   foreign_key: true
      t.timestamps
    end
  end
end
