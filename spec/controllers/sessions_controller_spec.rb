require 'spec_helper'

describe SessionsController, type: :controller do
  describe 'POST #new' do
    subject(:http_request) do
      post :new, params: { session: { user_id: user_id } }
    end

    before { http_request }

    context 'with an user existing in database and requesting for this one' do
      let(:user_id) { create(:user).uuid }

      it 'return not_found error' do
        expect(response).to have_http_status(:ok)
        expect(response_body['token']).not_to be_nil
      end
    end

    context 'with an user not existing in database' do
      let(:user_id) { 'unexisting uuid' }

      it 'return not_found error' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST #validate' do
    subject(:http_request) do
      post :validate, params: { session: { token: token } }
    end

    before { http_request }

    context 'with a valid token' do
      let(:user) { create(:user) }
      let(:token) { JwtHandler.new.create(user.uuid) }

      it 'return not_found error' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with wrong signature' do
      let(:user) { create(:user) }
      let(:token) { JWT.encode user.as_json, 'wrong-signature', 'HS256' }

      it 'return not_found error' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with a wrong format token' do
      let(:token) { 'wrong format' }

      it 'return not_found error' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
