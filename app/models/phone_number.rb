class PhoneNumber < ApplicationRecord
  belongs_to :person

  validates :number, :person_id, presence: true

end
