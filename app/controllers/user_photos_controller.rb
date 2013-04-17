class UserPhotosController < ApplicationController
  # TODO: Dla show wyświetlaj tylko zdjęcia widoczne dla @current_user

=begin
  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos.all
  end
=end

  def show
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:user_album_id])
    @photo = @album.photos.find(params[:id])
  end

  def new
    validate_user_id

    @album = @current_user.albums.find(params[:user_album_id])
    @photo = @album.photos.build
  end

  def edit
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:user_album_id])
    @photo = @album.photos.find(params[:id])
  end

=begin
  def edit
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:id])
  end
=end

  def create
    validate_user_id

    @album = @current_user.albums.find(params[:user_album_id])
    @photo = @album.photos.build(params[:photo])

    if @photo.save
      redirect_to user_user_album_user_photo_path(@current_user, @album, @photo), notice: 'Photo was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:user_album_id])
    @photo = @album.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to [@current_user, @cu_album, @photo], notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = @cu_album.photos.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to user_user_album_url(current_user, @cu_album) }
      format.json { head :no_content }
    end
  end

=begin
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
=end
end
