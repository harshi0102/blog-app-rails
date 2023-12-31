require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before { get '/users' }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('List of Users')
    end
  end

  describe 'GET #show' do
    before { get '/users/1' }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('User Profile')
    end
  end
end
