class InvestmentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @investments = Investment.all
  end

  def new
    @investment = Investment.new
  end

  def create
    @investment = Investment.new(investment_params)
    @investment.user = current_user
    if @investment.save
      redirect_to investments_path
    else
      render 'new'
    end
  end

  def show
    @investment = Investment.find(params[:id])
  end

  def edit
    @investment = Investment.find(params[:id])
  end

  def update
    @investment = Investment.find(params[:id])
    @investment.update(investment_params)
    redirect_to investments_path
  end

  def destroy
    @investment = Investment.find(params[:id])
    @investment.destroy
    flash[:notice] = 'Investment deleted successfully'
    redirect_to investments_path
  end

  private

  def investment_params
    params.require(:investment).permit(:name, :quantity)
  end

end
