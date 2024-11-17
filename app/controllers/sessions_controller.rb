class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = user.generate_jwt
      render json: { token: token, user: { id: user.id, name: user.name, email: user.email } }, status: :ok
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end
end
