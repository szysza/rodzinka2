class PermissionsToFamily < ActiveRecord::Base
  # TODO: kontrola unique (user, family)
  # TODO: Tak nadawana domyślna wartość nie działa!!! Przy zapisie pojawia się błąd o niespełnieniu walidacji.

  belongs_to :user
  belongs_to :family

  validates :moderator, presence: true

  before_create :default_init

  attr_accessible :moderator

  private

  def default_init
    self.moderator = false
  end
end
