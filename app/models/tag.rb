class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :organisations, through: taggings
end
