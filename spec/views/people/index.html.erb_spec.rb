require 'rails_helper'

RSpec.describe "people/index", type: :view do

  let(:person) { Person.create(:first_name => "Bob", :last_name => "Smith") }

  before(:each) do
    assign(:person, person)
    assign(:people, [
      Person.create!(
        :first_name => person.first_name,
        :last_name => person.last_name
      ),
      Person.create!(
        :first_name => person.first_name,
        :last_name => person.last_name
      )
    ])
  end

  it "renders a list of people" do
    render
    # assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "#{people.first_name} #{people.last_name}", :count => 2
  end
end
