require 'rails_helper'

describe FeedbacksController, type: :request do
  describe 'GET #index' do
    it 'has a 200 status code' do
      get feedbacks_url, as: :json
      expect(response.status).to eq(200)
    end
  end
end
