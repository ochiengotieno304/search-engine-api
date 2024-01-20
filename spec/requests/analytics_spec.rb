require 'rails_helper'

RSpec.describe "Analytics", type: :request do
  describe 'GET /analystics/overall' do
    it 'returns the overall analytics' do
      get analytics_overall_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /analytics/per_user/:id' do
    it 'returns the per user analytics' do
      user = User.create(ip_address: '1234')
      get analytics_per_user_path(user)
      expect(response).to have_http_status(200)
    end
  end
 
end
