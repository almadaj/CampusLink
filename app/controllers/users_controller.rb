class UsersController < ApplicationController
  before_action :authorize_request
  skip_before_action :authorize_request, only: [ :create ]
  def create
    user = User.new(user_params)
    if user.save
      render json: { message: "Usuário criado com sucesso", user: user.slice(:id, :name, :email, :registration, :role) }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params.except(:role))
      render json: { message: "Usuário atualizado com sucesso", user: user.slice(:id, :name, :email, :registration, :role) }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user.slice(:id, :name, :email, :registration, :role, :created_at)
  end

  def toggle_admin
    user = User.find(params[:id])
    if @current_user.role == 1
      new_role = user.role == 1 ? 0 : 1
      if user.update(role: new_role)
        message = new_role == 1 ? "Usuário promovido a administrador" : "Usuário demovido a usuário comum"
        render json: { message: message, user: user.slice(:id, :name, :email, :registration, :role) }
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: [ "Não autorizado." ] }, status: :forbidden
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :registration, :password, :password_confirmation, :role)
  end
end
