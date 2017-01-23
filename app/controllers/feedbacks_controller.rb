class FeedbacksController < ApplicationController
  respond_to :json

  def index
    respond_with Feedback.all
  end
end
