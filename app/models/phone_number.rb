class PhoneNumber < ApplicationRecord
  validates :number, presence: true
  validates :person_id, presence: true
  
end
