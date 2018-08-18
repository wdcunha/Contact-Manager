require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:bob) { Person.create(first_name: 'Bob', last_name: 'Jones') }
  let(:phone_number) do
     PhoneNumber.new(number: '939127475', person_id: bob.id)
  end

  it 'is valid' do
    expect(phone_number).to be_valid
  end

  it 'is invalid without a number' do
    phone_number.number = nil
    expect(phone_number).not_to be_valid
  end

  it 'is associated with a person' do
    # Solution: belongs_to :person put in the model
    expect(phone_number).to respond_to(:person)
  end
end
