class Album < ActiveRecord::Base
  # TODO: pozostałe walidacje

  has_many :photos

  belongs_to :owner, polymorphic: true

  validates :visibility, inclusion: { in: %w[public private] } # TODO: dorobić widoczność rodzinną

  mount_uploader :image, ImageUploader

  attr_accessible :user_id, :description, :name, :visibility, :image, :photos

end
