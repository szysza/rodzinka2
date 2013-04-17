class FamilyPhotosController < ApplicationController

=begin
  def index
    @family = Family.find(params[:family_id])
    @photos = @family.photos.all
  end
=end

  def show
    @family = Family.find(params[:family_id])
    @album = @family.albums.find(params[:family_album_id])
    @photo = @album.photos.find(params[:id])
  end

  def new
    @family = @current_user.families.find(params[:family_id])
    @album = @family.albums.find(params[:family_album_id])
    @photo = @album.photos.build
  end

=begin
  def edit
    @family = Family.find(params[:family_id])
    @photo = @family.photos.find(params[:id])
  end
=end

  def create
    @family = @current_user.families.find(params[:family_id])
    @album = @family.albums.find(params[:family_album_id])
    @photo = @album.photos.build(params[:photo])

    if @photo.save
      redirect_to family_family_album_family_photo_path(@family, @album, @photo), notice: 'Photo was successfully created.'
    else
      render action: "new"
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
