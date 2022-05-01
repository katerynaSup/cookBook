class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes_counters, dependent: :destroy
  has_many :users_who_liked, through: :likes_counters, source: :user

  def posted_comments
    comments.count
  end

  def owner
    self.user
  end
end
