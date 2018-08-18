class EmailAddress < ApplicationRecord
  belongs_to :person

  validates :address, :person_id, presence: true
end
