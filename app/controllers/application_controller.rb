class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token
  before_action :authorize_request

  private

  def authorize_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id]) if decoded
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { error: "Não autorizado" }, status: :unauthorized
  end
end
