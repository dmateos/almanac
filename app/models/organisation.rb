class Organisation < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name [Rails.env, self.base_class.to_s.pluralize.underscore].join('_')

  has_many :contacts, dependent: :destroy
  has_many :organisation_subjects
  has_many :subjects, through: :organisation_subjects

  belongs_to :street_state, class_name: "State", foreign_key: "street_state_id"
  belongs_to :post_state, class_name: "State", foreign_key: "post_state_id"
  belongs_to :dataset

  validates :name, presence: true
  validates :dataset, presence: true

  accepts_nested_attributes_for :contacts, allow_destroy: true
  has_attached_file :logo, styles: { normal: "100x100" }, default_url: "images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  scope :starts_with, -> (letter) { where("name LIKE :prefix", prefix: "#{letter}%") }

  def as_indexed_json(options = {}) 
    as_json(
      only: [:name, :aka, :comment, :services],
      include: [:subjects]
    )
  end
end
