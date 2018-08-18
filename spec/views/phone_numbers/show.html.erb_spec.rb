require 'rails_helper'

RSpec.describe "phone_numbers/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :first_name => "MyString",
      :last_name => "MyString"
    ))
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :number => "Number",
      :person_id => @person.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Person/)
  end
end
