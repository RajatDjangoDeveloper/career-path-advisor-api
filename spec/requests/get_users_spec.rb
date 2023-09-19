require 'rails_helper'

RSpec.describe 'User Registrations', type: :request do
  describe 'POST /users' do
    let(:valid_attributes) do
      {
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        name: 'John Doe',
        # Add other required attributes here
      }
    end

    context 'when valid user registration data is sent' do
      before do
        post '/users', params: { user: valid_attributes }
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:success)
      end

      it 'returns a success message' do
        expect(json['status']['message']).to eq('Signed up successfully.')
      end

      it 'returns the user data' do
        expect(json['data']['name']).to eq('John Doe')
        # Add other expectations for user attributes here
      end
    end

    context 'when invalid user registration data is sent' do
      before do
        post '/users', params: { user: valid_attributes.merge(email: nil) }
      end

      it 'returns an unprocessable entity response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        expect(json['status']['message']).to include("User couldn't be created successfully.")
      end
    end
  end
end
