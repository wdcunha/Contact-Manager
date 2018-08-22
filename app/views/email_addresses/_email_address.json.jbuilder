json.extract! email_address, :id, :address, :contact_id, :contact_type, :created_at, :updated_at
json.url email_address_url(email_address, format: :json)
