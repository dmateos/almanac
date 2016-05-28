class OrganisationSubject < ActiveRecord::Base
  belongs_to :organisation, class_name: "Organisation"
  belongs_to :subject, class_name: "Subject"
end
