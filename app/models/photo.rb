class Photo < ActiveRecord::Base
  # TODO: pozostałe walidacje

  # Oryginalne obrazy też przechowuje
  #has_attached_file :image, styles: { thumb: '100x100>', normal: '960x720>' }

  belongs_to :album

  validates :image, attachment_presence: true

  mount_uploader :image, ImageUploader

  attr_accessible :description, :name, :image
end
