class Subject < ActiveRecord::Base
  has_many :child_links, class_name: "SubjectLink", foreign_key: "parent_id"
  has_many :children, through: :child_links

  has_many :parent_links, class_name: "SubjectLink", foreign_key: "child_id"
  has_many :parents, through: :parent_links

  has_many :organisation_subjects
  has_many :organisations, through: :organisation_subjects

  scope :top_level, -> { includes(:parent_links).where( subject_links: { parent_id: nil } ) }

  scope :starts_with, -> (letter) { where("name LIKE :prefix", prefix: "#{letter}%") }
end
