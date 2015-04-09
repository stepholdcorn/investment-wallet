class InvestmentsController < ApplicationController

  def index
    @investments = Investment.all
  end

  def new
    @investment = Investment.new
  end

  def create
    Investment.create(investment_params)
    redirect_to investments_path
  end

  def show
    @investment = Investment.find(params[:id])
  end

  private

  def investment_params
    params.require(:investment).permit(:name, :quantity)
  end

end