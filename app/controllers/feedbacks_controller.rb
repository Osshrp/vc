class FeedbacksController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def index
    respond_with Feedback.all
  end

  def show
    @feedback = Feedback.find params[:id]
    respond_with @feedback
  end

  def create
    @feedback = Feedback.create feedback_params
    respond_with @feedback
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :body)
  end
end
