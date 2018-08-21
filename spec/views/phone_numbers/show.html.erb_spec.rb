require 'rails_helper'

RSpec.describe "phone_numbers/show", type: :view do
  let(:contact) {Person.create!(
    :first_name => "MyString",
    :last_name => "MyString"
    )}
  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :number => "Number",
      :contact_id => contact.id,
      :contact_type => 'Person'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Contact/)
  end
end
