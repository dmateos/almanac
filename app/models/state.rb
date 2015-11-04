class State < ActiveRecord::Base
  has_many :street_addresses, class_name: "Organisation", foreign_key: "street_state_id"
  has_many :postal_addresses, class_name: "Organisation", foreign_key: "post_state_id"
end
