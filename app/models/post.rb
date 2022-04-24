class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments, dependent: :destroy
  has_many :likes_counters, dependent: :destroy
end
