require 'rails_helper'

RSpec.describe "email_addresses/index", type: :view do
  let(:bob) { Person.create(first_name: 'Bob', last_name: 'Jones') }
  before(:each) do
    # assign(:bob, bob)
    assign(:email_addresses, [
      EmailAddress.create!(
        :address => "Address",
        :contact_id => bob.id,
        :contact_type => 'Person'
      ),
      EmailAddress.create!(
        :address => "Address",
        :contact_id => bob.id,
        :contact_type => 'Person'
      )
    ])
  end

  it "renders a list of email_addresses" do
    render
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => bob.id.to_s, :count => 2
  end
end
