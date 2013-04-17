module UserAlbumsHelper
  def user_album_thumb(album)
    album_thumb(album, :user_user_album_path)
  end
end
