class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments, dependent: :destroy
  has_many :likes_counters, dependent: :destroy
  has_many :users, through: :likes_counters
  has_many_attached :images

  def published?
    post_id?
  end

  def publish_to_twitter!
    tweet = user.client.update(content)
    update(post_id: tweet.id)
  end
end
