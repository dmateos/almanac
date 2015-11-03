class Tagging < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :tag
end
