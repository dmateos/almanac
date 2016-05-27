class SubjectLink < ActiveRecord::Base
  belongs_to :child, class_name: "Subject"
  belongs_to :parent, class_name: "Subject"
end
