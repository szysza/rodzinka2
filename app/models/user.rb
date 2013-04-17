class User < ActiveRecord::Base
  # TODO: pozostałe walidacje
  # TODO: Czy password_confirmation dobrze działa przy edycji użytkownika
  # (potwierdzenie nie powinno być wymagane)?
  # TODO: szyfrowanie hasła

  has_many :albums, as: :owner
  has_many :permissions_to_families
  has_many :families, through: :permissions_to_families
  has_many :received_invitations, class_name: 'Invitation', foreign_key: 'recipient_id'
  has_many :sent_invitations, class_name: 'Invitation', foreign_key: 'sender_id'

  validates :password, :password_confirmation, presence: true
  validates :gender, inclusion: { in: %w[male female] }
  validates :password, confirmation: true

  attr_accessible :birthdate, :description, :email, :first_name,
                  :gender, :last_name, :password, :password_confirmation

  def name
    "#{first_name} #{last_name}"
  end

  def create_family(attributes)
    # TODO: Generuje brzydki SQL - niepotrzebny update

    transaction do
      family = Family.new(attributes)
      permissions = PermissionsToFamily.new(moderator: true)

      family.permissions_to_families << permissions
      permissions_to_families << permissions

      family.save!
      family
    end
  end

  def moderated_families
    families.where('permissions_to_families.moderator' => true)
    #families.joins(:permissions_to_families)
    #  .where('permissions_to_families.moderator' => true)
  end

  def moderated_families_without(user)
    # TODO: nazwa metody?

    moderated_families.where('families.id' => user.duplicated_other_families)
  end

  def moderates?(family)
    permissions = permissions_to_families.where(family_id: family).first
    permissions && permissions.moderator
  end

  def build_invitations_for(user)
    # TODO: Czy nie powinno zostać rodzielone na metodę zwracającą rodzinę
    # + build_invitations_for w helperze?

    return [] if user == self

    family_ids = user.received_invitations.select(:family_id).to_sql
    moderated_families.where("families.id NOT IN (#{family_ids})")
      .map { |family| family.invitations.new(recipient: user, sender: self) }
  end

  def pending_invitations
    # TODO: nazwa metody?

    received_invitations.where(accepted: nil)
  end

  protected

  def duplicated_other_families
    # TODO: nazwa metody?

    Family.joins(:permissions_to_families)
      .where('permissions_to_families.user_id <> ?', self)
  end

=begin
  def other_than_received_invitations

  end
=end

  class << self
    def authenticate(email, password)
      where(email: email, password: password).first
    end
  end
end
