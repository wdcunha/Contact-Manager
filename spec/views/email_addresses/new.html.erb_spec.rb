require 'rails_helper'

RSpec.describe "email_addresses/new", type: :view do
  let(:person) { Person.create(:first_name => "Bob", :last_name => "Smith") }
  let(:email_address) { EmailAddress.new(:contact_id => person.id, :contact_type => "Person", :address => "MyString") }
  before(:each) do
    assign(:email_address, email_address)
  end
  # before(:each) do
  #   assign(:email_address, EmailAddress.new(
  #     :address => "MyString",
  #     :contact_id => 1
  #   ))
  # end

  it "renders new email_address form" do
    render

    assert_select "form[action=?][method=?]", email_addresses_path, "post" do

      assert_select "input[name=?]", "email_address[address]"

      assert_select "input[name=?]", "email_address[contact_id]"
    end
  end

  it "shows the contact's name in the title" do
    render
    assert_select("h1", text: "New Email Address for #{email_address.contact.last_name}, #{email_address.contact.first_name}")
  end

end
