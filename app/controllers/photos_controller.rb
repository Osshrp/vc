class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  # protect_from_forgery with: :null_session
  # respond_to :html
  respond_to :html, :json

  def index
    @photos = Photo.all
    respond_with Photo.all
  end

  def show
    respond_with @photo
  end
  
  def new
    @photo = Photo.new
    respond_with @photo
  end
  #
  # def edit
  #   respond_with @photo
  # end

  def create
    @photo = Photo.new photo_params
    # if @photo.save
    respond_with @photo.save, location: photos_path
    #   render json: {photo: @photo, msg: 'Photo successfully loaded',
    #                 redirect_to: 'photos_path'}
    # else
    #   render json: {errors: @photo.errors,
    #                 msg: @photo.errors.full_messages.join(', ')},
    #                 status: 422
    # end
  end

  def destroy
    respond_with @photo.destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end

  def set_photo
    @photo = Photo.find params[:id]
  end
end
