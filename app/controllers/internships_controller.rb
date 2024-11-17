class InternshipsController < ApplicationController
  before_action :authorize_request
  def index
    @internships = Internship.all
    render json: @internships
  end

  def show
    @internship = Internship.find(params[:id])
    render json: @internship
  end

  def create
    @internship = Internship.new(internship_params)
    if @internship.save
      render json: @internship, status: :created
    else
      render json: @intership.errors, status: :unprocessable_entity
    end
  end

  def update
    @internship = Internship.find(params[:id])
    if @internship.update(internship_params)
      render json @internship
    else
      render json @internship.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @internship = Internship.find(params[:id])
    @internship.destroy
      render json: { "message": "Internship deleted successfully" }
  end

  private
  def internship_params
    params.require(:internship).permit(:company_id, :student_id, :salary, :workload, :start_date, :end_date)
  end
end
