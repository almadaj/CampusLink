class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token

  private

  def authorize_request
    header = request.headers["Authorization"]
    puts "Header: #{header}"
    if header
      token = header.split(" ").last
      decoded = JsonWebToken.decode(token)
      @current_user = User.find(decoded[:user_id]) if decoded
    else
      render json: { error: "Não autorizado" }, status: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError => e
    Rails.logger.error "JWT Decode Error: #{e.message}"
    render json: { error: "Não autorizado" }, status: :unauthorized
  end
end
