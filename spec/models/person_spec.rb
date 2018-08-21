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

  # it 'has an array of phone numbers' do
  it 'responds with its created phone numbers' do
    # expect(person.phone_numbers).to eq([])
    person.phone_numbers.build(number: '555-8888')
    expect(person.phone_numbers.map(&:number)).to eq(['555-8888'])
  end

  # it 'has an array of emails' do
  it 'responds with its created email addresses' do
    # expect(person.email_addresses).to eq([])
    person.email_addresses.build(address: 'me@example.com')
    expect(person.email_addresses.map(&:address)).to eq(['me@example.com'])
  end
end
