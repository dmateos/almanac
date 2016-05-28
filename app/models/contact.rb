class Contact < ActiveRecord::Base
  belongs_to :organisation
  enum c_types: [:phone, :mobile, :email, :fax, :website]
  validates_inclusion_of :c_type, in: Contact.c_types.keys
end
