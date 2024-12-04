class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  # after_action :verify_authorized, except: [:home, :show], unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: [:home, :index, :show], unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: [:index, :show], unless: :skip_pundit?

  # Desabilitado enquanto procuramos solução, continuar depois.

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referer || root_path)
  end

end
