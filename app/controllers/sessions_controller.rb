class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:current_user_id] = user.id
      redirect_to root_url
    else
      # TODO: dodac wiadomosc do flasha
      render action: "new"
    end
  end

  def destroy
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end
end
