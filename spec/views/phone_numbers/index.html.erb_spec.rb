require 'rails_helper'

RSpec.describe "phone_numbers/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :first_name => "First Name",
        :last_name => "Last Name"
      )
    ])
    assign(:phone_numbers, [
      PhoneNumber.create!(
        :number => "Number",
        :person_id => :people.id
      ),
      PhoneNumber.create!(
        :number => "Number",
        :person_id => :people.id
      )
    ])
  end

  it "renders a list of phone_numbers" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Person".to_s, :count => 2
  end
end
