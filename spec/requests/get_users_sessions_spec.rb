require 'rails_helper'

RSpec.describe 'User Sessions', type: :request do
  describe 'POST /users/sign_in' do
    let(:user) { FactoryBot.create(:user) }
    let(:valid_credentials) { { email: user.email, password: 'your_password' } }

    context 'with valid credentials' do
      before do
        post '/users/sign_in', params: valid_credentials
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns a JSON response with user data' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(json['status']['code']).to eq(200)
        expect(json['status']['message']).to eq('Logged in successfully.')
        expect(json['status']['data']['user']['email']).to eq(user.email)
        # Add more expectations for user attributes as needed
      end
    end

    context 'with invalid credentials' do
      before do
        post '/users/sign_in', params: { email: 'invalid@example.com', password: 'wrong_password' }
      end

      it 'returns an unauthorized response' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns an error message' do
        expect(json['status']['code']).to eq(401)
        expect(json['status']['message']).to eq("Invalid email or password.")
      end
    end
  end

  describe 'DELETE /users/sign_out' do
    let(:user) { FactoryBot.create(:user) }

    context 'when user is signed in' do
      before do
        sign_in user
        delete '/users/sign_out'
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns a success message' do
        expect(json['status']['code']).to eq(200)
        expect(json['status']['message']).to eq('Logged out successfully.')
      end
    end

    context 'when user is not signed in' do
      before do
        delete '/users/sign_out'
      end

      it 'returns an unauthorized response' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns an error message' do
        expect(json['status']['code']).to eq(401)
        expect(json['status']['message']).to eq("Couldn't find an active session.")
      end
    end
  end
end
