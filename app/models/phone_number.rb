class PhoneNumber < ApplicationRecord
  validates :number, :contact_id, :contact_type, presence: true
  
  belongs_to :contact, polymorphic: true

end
