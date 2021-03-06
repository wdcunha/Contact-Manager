require 'rails_helper'

RSpec.describe Company, type: :model do

  let(:company) do
    Company.create(name: 'GodInWell')
  end

  let(:invalid_attributes) { { name: nil } }

  it "is valid" do
    expect(company).to be_valid
  end

  it "is invalid without a name" do
    company.name = nil
    expect(company).not_to be_valid
  end

  it "convert to a string with Name" do
    expect(company.to_s).to eq "GodInWell"
  end
  it "has an array of phone_numbers" do
    expect(company.phone_numbers).to eq([])
  end

  it "responds with its phone numbers after they're created" do
    phone_number = company.phone_numbers.build(number: "333-4444")
    expect(phone_number.number).to eq('333-4444')
  end

  it 'has an array of emails' do
    expect(company.email_addresses).to eq([])
  end

  it "responds with its created email addresses" do
    company.email_addresses.build(address: 'a@example.com')
    expect(company.email_addresses.map(&:address)).to eq(['a@example.com'])
  end
end
