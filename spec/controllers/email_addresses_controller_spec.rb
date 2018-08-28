require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe EmailAddressesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # EmailAddress. As you add validations to EmailAddress, be sure to
  # adjust the attributes here as well.
  let(:bob) { Person.create(first_name: 'Bob', last_name: 'Jones') }
  let(:valid_attributes) { { address: 'admin@example.com', contact_id: bob.id, contact_type: 'Person' } }
  let(:new_attributes) { { address: 'MyNewString', contact_id: bob.id, contact_type: 'Person' } }
  let(:invalid_attributes) { { address: nil, contact_id: nil, contact_type: nil } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EmailAddressesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      email_address = EmailAddress.create! valid_attributes
      get :edit, params: {id: email_address.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do

      let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }
      let(:valid_attributes) { {address: 'b@example.com', contact_id: alice.id, contact_type: 'Person'}}

      it "creates a new EmailAddress" do
        expect {
          post :create, params: {email_address: valid_attributes}, session: valid_session
        }.to change(EmailAddress, :count).by(1)
      end

      it "redirects to the created email_address's contact" do
        # post :create, params: {email_address: valid_attributes}, session: valid_session
        # expect(response).to redirect_to(EmailAddress.last)
        alice = Person.create(first_name: 'Alice', last_name: 'Smith')
        valid_attributes = {address: 'a@example.com', contact_id: alice.id, contact_type: 'Person'}
        post :create, params: {email_address: valid_attributes}, session: valid_session
        expect(response).to redirect_to(alice)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {email_address: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      # let(:new_attributes) {
      #   skip("Add a hash of attributes valid for your model")
      # }

      it "updates the requested email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, params: {id: email_address.to_param, email_address: new_attributes}, session: valid_session
        email_address.reload
        # skip("Add assertions for updated state")
        expect(email_address.address).to eq("MyNewString")
        expect(email_address.contact_id).to eq(bob.id)
      end

      it "redirects to the email_address" do
        # email_address = EmailAddress.create! valid_attributes
        # put :update, params: {id: email_address.to_param, email_address: valid_attributes}, session: valid_session
        # expect(response).to redirect_to(email_address)
        bob = Person.create(first_name: 'Bob', last_name: 'Jones')
        valid_attributes = {address: 'e@example.com', contact_id: bob.id, contact_type: 'Person'}
        email_address = EmailAddress.create! valid_attributes
        put :update, params: {id: email_address.to_param, email_address: valid_attributes}, session: valid_session
        expect(response).to redirect_to(bob)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        email_address = EmailAddress.create! valid_attributes
        put :update, params: {id: email_address.to_param, email_address: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested email_address" do
      email_address = EmailAddress.create! valid_attributes
      expect {
        delete :destroy, params: {id: email_address.to_param}, session: valid_session
      }.to change(EmailAddress, :count).by(-1)
    end

    it "redirects to the email_addresses list" do
      bob = Person.create(first_name: 'Bob', last_name: 'Jones')
      valid_attributes = {address: 'e@example.com', contact_id: bob.id, contact_type: 'Person'}
      email_address = EmailAddress.create! valid_attributes
      delete :destroy, params: {id: email_address.to_param}, session: valid_session
      expect(response).to redirect_to(bob)
    end
  end

end
