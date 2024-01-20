# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    it 'returns a user' do
      user = User.create(ip_address: '1234')
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
