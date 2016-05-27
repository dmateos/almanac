class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  validates :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :mobile, presence: true
  validates :position, presence: true
end
