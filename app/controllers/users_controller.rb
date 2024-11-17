class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [ :create ]  # Permitir criação de usuários sem autenticação

  def create
    user = User.new(user_params)
    if user.save

      render json: { message: "Usuário criado com sucesso", user: user.slice(:id, :name, :email, :registration, :role) }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :registration, :password, :password_confirmation, :role)
  end
end
