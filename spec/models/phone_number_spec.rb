require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:phone_number) { PhoneNumber.new(number: '939127475') }

  it 'is valid' do
    expect(phone_number).to be_valid
  end

  it 'is invalid without a number' do
    phone_number.number = nil
    expect(phone_number).not_to be_valid
  end
end
