require 'rails_helper'

describe 'the company view', type: :feature do

  let(:company) { Company.create(name: 'MakingWellDone') }

  describe 'phone numbers' do
    before(:each) do
      company.phone_numbers.create(number: "555-1234", contact_type: 'Company')
      company.phone_numbers.create(number: "555-5678", contact_type: 'Company')
      visit company_path(company)
    end

    it 'shows the phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add a new phone number' do
      # expect(page).to have_link('Add phone number', href: new_phone_number_path)
      expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: company.id, contact_type: 'Company'))
    end

    it 'adds a new phone number' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-8888')
      page.click_button('Create Phone number')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-8888')
    end

    it 'has links to edit phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = company.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9191')
      page.click_button('Update Phone number')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-9191')
      expect(page).to_not have_content(old_number)
    end

    it 'has links to destroy phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link('delete', href: phone_number_path(phone))
      end
    end
  end

  describe '- email addresses -' do
    before(:each) do
      company.email_addresses.create(address: "one@example.com")
      company.email_addresses.create(address: "two@example.com")
      visit company_path(company)
    end

    it "has LIs for each email address" do
      company.email_addresses.each do |email|
        expect(page).to have_selector('li', count: 2)
      end
    end

    it "has an add email address link" do
      expect(page).to have_link('Add email address', href: new_email_address_path(contact_id: company.id))
    end

    it "adds a new email address" do
      page.click_link('Add email address')
      page.fill_in('Address', with: 'a@example.com')
      page.click_button('Create Email address')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('a@example.com')
    end

    it 'has links to edit email address' do
      company.email_addresses.each do |email|
        expect(page).to have_link('edit', href: edit_email_address_path(email))
      end
    end

    it 'edits an email address' do
      email = company.email_addresses.first
      old_email = email.address

      first(:link, 'edit').click
      page.fill_in('Address', with: 'e@example.com')
      page.click_button('Update Email address')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('e@example.com')
      expect(page).to_not have_content(old_email)
    end

    it 'has links to destroy email address' do
      company.email_addresses.each do |email|
        expect(page).to have_link('delete', href: email_address_path(email))
      end
    end

  end

end
