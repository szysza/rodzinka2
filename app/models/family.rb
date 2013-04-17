class Family < ActiveRecord::Base
  has_many :albums, as: :owner
  has_many :permissions_to_families
  has_many :users, through: :permissions_to_families
  has_many :invitations

  attr_accessible :description, :name
end
