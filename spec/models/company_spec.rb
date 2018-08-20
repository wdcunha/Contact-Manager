require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) do
    Company.create(name: 'GodingWell')
  end
  
  let(:invalid_attributes) { { name: nil } }

  it "is valid" do
    expect(company).to be_valid
  end

  it "is invalid without a name" do
    company.name = nil
    expect(company).not_to be_valid
  end


end
