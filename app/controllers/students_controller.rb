class StudentsController < ApplicationController
  before_action :authorize_request
  def index
    @students = Student.all
    render json: @students
  end

  def show
    @student = Student.find(params[:id])
    render json: @student
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      render json: @student, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    render json: { "message": "User deleted successfully" }
  end

  def internships_by_student
    @student = Student.find(params[:id])
    @internships = @student.internships
    render json: @internships
  end

  private
  def student_params
    params.require(:student).permit(:student_number, :name, :email, :birth, :phone, :address, :course)
  end
end
