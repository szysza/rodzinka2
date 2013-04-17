module AlbumsHelper
  def album_thumb(album, album_path_method)
    # TODO: Zamienić na ładniejszy html?
    # TODO: Inny obrazek domyślny
    image = album.image ? album.image.url(:thumb) : 'rails.png'
    album_path = method(album_path_method)
    link_to raw("#{image_tag(image)} </br> #{album.name}"), album_path.call(album.owner, album)
  end
end