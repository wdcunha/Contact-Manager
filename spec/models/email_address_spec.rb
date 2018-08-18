require 'rails_helper'

RSpec.describe EmailAddress, type: :model do

  let(:bob) { Person.create(first_name: 'Bob', last_name: 'Jones') }
  let(:email_address) do
     EmailAddress.new(address: 'admin@example.com', person_id: bob.id)
  end

  it 'is valid' do
    expect(email_address).to be_valid
  end

  it 'is invalid without an email' do
    email_address.address = nil
    expect(email_address).not_to be_valid
  end

  it "is associated with a person" do
    expect(email_address).to respond_to(:person)
  end
end
