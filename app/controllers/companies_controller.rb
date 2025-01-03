class CompaniesController < ApplicationController
  before_action :authorize_request
  def index
    @companies = Company.all
    render json: @companies
  end

  def show
    @company = Company.find(params[:id])
    render json: @company
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company, status: :created
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    render json: { "message": "Company deleted successfully" }
  end

  def interns_by_company
    @company = Company.find(params[:id])
    @interns = @company.internships.includes(:student).map(&:student)
    render json: @interns
  end

  private
  def company_params
    params.require(:company).permit(:name, :cnpj, :address, :phone, :email)
  end
end
