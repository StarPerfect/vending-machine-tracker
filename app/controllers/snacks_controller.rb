class SnacksController < ApplicationController
  def show
    @snack = Snack.find(params[:id])
  end

  private
  def snack_params
    params.permit(:name, :price)
  end
end
