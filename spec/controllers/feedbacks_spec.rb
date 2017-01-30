require 'rails_helper'

describe FeedbacksController, type: :request do
  let!(:feedback) { FactoryGirl.create(:feedback) }
  before do
    get feedbacks_url, as: :json
  end
  describe 'GET #index' do
    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it "has json content type" do
      expect(response.headers['Content-Type'])
        .to eq('application/json; charset=utf-8')
    end

    it "has fields: email, body" do
      expect((JSON.parse(response.body)).first.keys)
        .to contain_exactly("id",
                            "email",
                            "body",
                            "created_at")
    end
  end

  describe "POST #create" do
    before do
      post feedbacks_url, as: :json,
        params: { "feedback":
                  {
                    "email": "test@examle.com",
                    "body": "Some text"
                  }
                }
    end
    it "has a 200 status code" do
      expect(response.status).to eq(200)
    end

    # it "returns 'Feedback created'" do
    #   expect(JSON.parse(response.body)).to include({"msg" => "Feedback created"})
    # end
  end
end
