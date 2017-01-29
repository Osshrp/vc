class PhotosController < ApplicationController
  # before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  # protect_from_forgery with: :null_session
  respond_to :html, :json

  def index
    respond_with Photo.all
  end

  # def show
  #   respond_with @photo
  # end
  #
  # def new
  #   @photo = Photo.new
  #   respond_with @photo
  # end
  #
  # def edit
  #   respond_with @photo
  # end

  def create
    @photo = Photo.new photo_params
    if @photo.save
      render json: {photo: @feedback, msg: 'Feedback successfully created',
                    redirect_to: 'photos_path'}
    else
      render json: {errors: @photo.errors,
                    msg: @photo.errors.full_messages.join(', ')},
                    status: 422
    end
  end

  # def update
  #   if @feedback.update(feedback_params)
  #     render json: {feedback: @feedback, msg: 'Feedback successfully updated',
  #                   redirect_to: 'feedbacks_path'}
  #   else
  #     render json: {errors: @feedback.errors,
  #                   msg: @feedback.errors.full_messages.join(', ')},
  #                   status: 422
  #   end
  # end
  #
  # def destroy
  #   respond_with @feedback.destroy
  # end

  private

  def set_feedback
    @feedback = Feedback.find params[:id]
  end

  def photo_params
    params.require(:photo).permit(:image)
  end
end
