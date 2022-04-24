class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes_counters, dependent: :destroy

  require 'bcrypt'
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_pass)
    @password = Password.create(new_pass)
    self.password_hash = @password
  end
end
