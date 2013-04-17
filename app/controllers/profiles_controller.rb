class ProfilesController < ApplicationController
  def invitations
    @invitations = @current_user.pending_invitations
  end
end
