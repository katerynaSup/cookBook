class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments, dependent: :destroy
  has_many :likes_counters, dependent: :destroy
  has_many :users_who_liked, through: :likes_counters, source: :user
  has_many_attached :images
  
  def posted_comments
    comments.count
  end
end
