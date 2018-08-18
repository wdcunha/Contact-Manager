require 'rails_helper'

RSpec.describe Person, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:person) do
    Person.new(first_name: 'Alice', last_name: 'Smith')
  end

  it 'is valid' do
    expect(person).to be_valid
  end

  it 'is invalid without a first name' do
    # person = Person.new(first_name: nil)
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it 'is invalid without a last name' do
    # person = Person.new(first_name: 'Bob', last_name: nil)
    person.last_name = nil
    expect(person).not_to be_valid
  end

  it 'has an array of phone numbers' do
    expect(person.phone_numbers).to eq([])
  end

  it 'has an array of emails' do
    expect(person.email_addresses).to eq([])
  end
end
