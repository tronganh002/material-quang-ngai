class StatiticChartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @data_set = ChartService.data_set(params[:tab])
    return if request.format.html?
    render json: {data_set: @data_set}
  end
end
