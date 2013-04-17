module InvitationsHelper
  def invite_html_id(invitation)
    # Nie może być invitation.id, bo invitation może być nowym rekordem
    "invite#{invitation.family.id}"
  end

  def invitation_html_id(invitation)
    "invitation#{invitation.id}"
  end
end
