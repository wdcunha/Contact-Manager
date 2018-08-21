require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:person) { Person.create(first_name: 'Bob', last_name: 'Jones') }
  let(:phone_number) do
     PhoneNumber.new(number: '939127475', contact_type: 'Person', contact_id: person.id)
  end

  it 'is valid' do
    expect(phone_number).to be_valid
  end

  it 'is invalid without a number' do
    phone_number.number = nil
    expect(phone_number).not_to be_valid
  end

  it 'must have a reference to a contact' do
    phone_number.contact_id = nil
    expect(phone_number).not_to be_valid
  end

  it 'is associated with a contact' do
    # Solution: belongs_to :person put in the model
    expect(phone_number).to respond_to(:contact)
  end
end
