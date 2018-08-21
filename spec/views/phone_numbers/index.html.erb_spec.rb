require 'rails_helper'

RSpec.describe "phone_numbers/index", type: :view do
  let(:bob){ Person.create(first_name: 'Bob', last_name: 'Jones')}
  before(:each) do
    # assign(:bob, bob)
    # bob = Person.create!(
    #   :first_name => "Bob",
    #   :last_name => "Jones"
    # ),
    assign(:phone_numbers, [
      PhoneNumber.create!(
        :number => "Number",
        :contact_id => bob.id,
        :contact_type => 'Person'
      ),
      PhoneNumber.create!(
        :number => "Number",
        :contact_id => bob.id,
        :contact_type => 'Person'
      )
    ])
  end

  it "renders a list of phone_numbers" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => bob.id.to_s, :count => 2
  end
end
