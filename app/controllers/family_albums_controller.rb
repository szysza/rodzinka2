class FamilyAlbumsController < ApplicationController
  def index
    # TODO: wyświetlaj tylko albumy widoczne dla @current_user

    @family = Family.find(params[:family_id])
    @albums = @family.albums
  end

  def show
    @family = Family.find(params[:family_id])
    @album = @family.albums.find(params[:id])
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @family = @current_user.families.find(params[:family_id])
    @album = @family.albums.build
  end

=begin
  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end
=end

  # POST /albums
  # POST /albums.json
  def create
    @family = @current_user.families.find(params[:family_id])
    @album = @family.albums.build(params[:album])

    if @album.save
      redirect_to family_family_album_path(@family, @album), notice: 'Album was successfully created.'
    else
      render action: "new"
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
