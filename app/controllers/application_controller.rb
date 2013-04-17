class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :assign_current_user

  # TODO: wyrzucanie niezalogowanych

  private

  def assign_current_user
    @current_user = current_user
  end

  def current_user
    @_current_user ||= session[:current_user_id] &&
        User.find_by_id(session[:current_user_id])
  end

  def validate_user_id
    # TODO: Inny wyjatek? Czy w ogóle wyjątek jest ok?
    raise unless @current_user.id == params[:user_id].to_i
  end
end
