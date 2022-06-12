class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :post_id, presence: true
  validates :user_id, presence: true
  def owner
    self.body_came_from_user?
  end
end
