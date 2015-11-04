class Organisation < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :contacts, dependent: :destroy
  validates :name, presence: true

  accepts_nested_attributes_for :contacts, allow_destroy: true

  has_attached_file :logo, styles: { normal: "100x100" }, default_url: "images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
