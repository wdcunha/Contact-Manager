require 'rails_helper'

RSpec.describe "email_addresses/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :first_name => "MyString",
      :last_name => "MyString"
    ))
    @email_address = assign(:email_address, EmailAddress.create!(
      :address => "Address",
      :person_id => @person.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Person/)
  end
end
