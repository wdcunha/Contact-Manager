require 'rails_helper'

RSpec.describe "email_addresses/edit", type: :view do
  let(:bob) { Person.create(first_name: 'Bob', last_name: "Jones")}
  before(:each) do
    # @person = assign(:person, Person.create!(
    #   :first_name => "MyString",
    #   :last_name => "MyString"
    # ))
    @email_address = assign(:email_address, EmailAddress.create!(
      :address => "MyString",
      :contact_id => bob.id,
      :contact_type => 'Person'
    ))
  end

  it "renders the edit email_address form" do
    render

    assert_select "form[action=?][method=?]", email_address_path(@email_address), "post" do

      assert_select "input[name=?]", "email_address[address]"

      assert_select "input[name=?]", "email_address[contact_id]"

      assert_select "input[name=?]", "email_address[contact_type]"
    end
  end
end
