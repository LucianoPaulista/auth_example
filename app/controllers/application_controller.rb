class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters,
                if: :devise_controller?
  include Pundit
  include ActionController::MimeResponds
  respond_to :json
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  private
  def user_not_authorized
    render json: { message: 'Você não está autorizado a acessar!!!' }, status: :unauthorized
  end
end
