class InvitationsController < ApplicationController
  def index
    @family = @current_user.families.find(params[:family_id])
    @invitations = @family.invitations # TODO: tylko wybrane
  end

=begin
  def show
    @invitation = Invitation.where(
        family: params[:family_id], id: params[:id]).first
  end

  def new
    @family = Family.find(params[:family_id])
    @invitation = @family.invitations.new
  end

  def edit
    @invitation = Invitation.find(params[:id])
  end
=end

  def create
    respond_to do |format|
      @family = @current_user.moderated_families.find(params[:family_id])
      @invitation = @family.invitations.new(params[:invitation])
      @current_user.sent_invitations << @invitation

      @invitation.save
      format.js
    end
  end

  def update
    # TODO: Zamienić conditions: {...} na coś innego, bo ten zapis zostanie porzucony w Rails 4
    # TODO: Czy nie powinno się przenieść części zapytania do modelu ?

    @family = Family.find(params[:family_id])

    @invitation = @family.invitations.find(params[:id],
      conditions: { recipient_id: @current_user, accepted: nil })

    respond_to do |format|
      @invitation.confirm
      format.js
    end
  end

  def destroy
    # TODO: Zamienić conditions: {...} na coś innego, bo ten zapis zostanie porzucony w Rails 4
    # TODO: Czy nie powinno się przenieść części zapytania do modelu ?

    @family = Family.find(params[:family_id])

    @invitation = @family.invitations.find(params[:id],
      conditions: { recipient_id: @current_user, accepted: nil })

    respond_to do |format|
      @invitation.refuse
      format.js
    end
  end
end
