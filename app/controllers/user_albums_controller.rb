class UserAlbumsController < ApplicationController
  # TODO: Dla index, show wyświetlaj tylko albumy widoczne dla @current_user
  # TODO: Czy new, edit, create, update, destroy nie powinno być wydzielone do nowego kontrolera
  # ProfileAlbums? Nie trzebaby wtedy robić sprawdzeń user_id.

  def index
    @user = User.find(params[:user_id])
    @albums = @user.albums
  end

  def show
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:id])
  end

  def new
    validate_user_id
    @album = @current_user.albums.build
  end

=begin
  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end
=end

  def create
    validate_user_id

    @album = @current_user.albums.build(params[:album])

    if @album.save
      redirect_to user_user_album_path(@current_user, @album), notice: 'Album was successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @album = @current_user.albums.find(params[:id])
  end

  def destroy
    @album = @current_user.albums.find(params[:id])
    @album.destroy
    respond_to do |format|
      format.html { redirect_to user_user_albums_url }
      format.json { head :no_content }
    end
  end

=begin
  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end
=end
end
