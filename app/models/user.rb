class User < ApplicationRecord
  has_many :posts
  has_many :likes_counters, dependent: :destroy
  has_many :liked_posts, through: :likes_counters, source: :posts
  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :password_hash, presence: true
  require 'bcrypt'
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_pass)
    @password = Password.create(new_pass)
    self.password_hash = @password
  end

  def full_name
    "#{first_name}  #{last_name}"
  end

  def client
  end
end
