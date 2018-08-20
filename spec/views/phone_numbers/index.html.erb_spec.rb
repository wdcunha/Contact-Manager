require 'rails_helper'

RSpec.describe "phone_numbers/index", type: :view do
  before(:each) do
    # assign(:bob, [
    #   Person.create!(
    #     :first_name => "Bob",
    #     :last_name => "Jones"
    #   )
    # ])
    bob = Person.create!(
      :first_name => "Bob",
      :last_name => "Jones"
    ),
    assign(:phone_numbers, [
      PhoneNumber.create!(
        :number => "Number",
        :person_id => bob.id
      ),
      PhoneNumber.create!(
        :number => "Number",
        :person_id => bob.id
      )
    ])
  end

  it "renders a list of phone_numbers" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 3
    assert_select "tr>td", :text => bob.id.to_s, :count => 3
  end
end
