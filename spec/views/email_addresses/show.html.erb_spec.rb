require 'rails_helper'

RSpec.describe "email_addresses/show", type: :view do
  let(:contact) {Person.create!(
    :first_name => "MyString",
    :last_name => "MyString"
  )}
  before(:each) do
    @email_address = assign(:email_address, EmailAddress.create!(
      :address => "Address",
      :contact_id => contact.id,
      :contact_type => 'Person'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Contact/)
  end
end
