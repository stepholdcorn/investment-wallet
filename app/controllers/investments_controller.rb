class InvestmentsController < ApplicationController

  def index
    @investments = Investment.all
  end

end
