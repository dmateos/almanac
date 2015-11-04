class Contact < ActiveRecord::Base
  belongs_to :organisation
  enum c_types: [:phone, :mobile, :email, :fax, :website]
end
