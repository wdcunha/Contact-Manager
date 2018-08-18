require 'rails_helper'

RSpec.describe "email_addresses/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :first_name => "MyString",
      :last_name => "MyString"
    ))
    @email_address = assign(:email_address, EmailAddress.create!(
      :address => "MyString",
      :person_id => @person.id
    ))
  end

  it "renders the edit email_address form" do
    render

    assert_select "form[action=?][method=?]", email_address_path(@email_address), "post" do

      assert_select "input[name=?]", "email_address[address]"

      assert_select "input[name=?]", "email_address[person_id]"
    end
  end
end
