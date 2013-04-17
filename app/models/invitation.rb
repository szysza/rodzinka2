class Invitation < ActiveRecord::Base
  # accepted - true, false, nil (nie podjęto jeszcze decyzji)
  # TODO: Czy accepted może być modyfikowane wprost: invitation.accepted = false?
  # Jeśli tak, zabronić tego.

  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'
  belongs_to :family

  attr_accessible :recipient, :sender, :recipient_id, :family_id

  def confirm
    with_transaction_returning_status do
      if accepted.nil?
        self.accepted = true
        family.users << recipient

        save && family.save
      end
    end
  end

  def refuse
    # TODO: Zamienić self.accepted = false na coś w stylu update_attributes(accepted: false),
    # gdy dowiem się, jak sobie radzic z mass assigment

    if accepted.nil?
      self.accepted = false
      save
    end
  end
end
