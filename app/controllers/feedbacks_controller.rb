class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  # protect_from_forgery with: :null_session
  respond_to :html, :json

  def index
    respond_with Feedback.all
  end

  def show
    respond_with @feedback
  end

  def new
    @feedback = Feedback.new
    respond_with @feedback
  end

  def edit
    respond_with @feedback
  end

  def create
    @feedback = Feedback.new feedback_params
    if @feedback.save
      render json: {feedback: @feedback, msg: 'Feedback successfully created',
                    redirect_to: 'feedbacks_path'}
    else
      render json: {errors: @feedback.errors,
                    msg: @feedback.errors.full_messages.join(', ')},
                    status: 422
    end
  end

  def update
    if @feedback.update(feedback_params)
      render json: {feedback: @feedback, msg: 'Feedback successfully updated',
                    redirect_to: 'feedbacks_path'}
    else
      render json: {errors: @feedback.errors,
                    msg: @feedback.errors.full_messages.join(', ')},
                    status: 422
    end
  end

  def destroy
    respond_with @feedback.destroy
  end

  private

  def set_feedback
    @feedback = Feedback.find params[:id]
  end

  def feedback_params
    params.require(:feedback).permit(:email, :body)
  end
end
