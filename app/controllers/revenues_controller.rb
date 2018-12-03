class RevenuesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :set_default_material
  before_action :verify_admin, only: :destroy

  def index
    @materials = Material.revenue_type
    @statistic = Statistic.where(material_id: @materials.pluck(:id)).to_json
    @materials = @materials.to_json
    return if request.format.html?
    render json: {statistic: load_statistic, message: :success}
  end

  def create
    statistic = Statistic.new(material_id: params[:material_id], time_input: params[:time], mass: params[:mass], price: params[:price])
    if statistic.save
      render json: {statistic: load_statistic, message: :success}
    else
      render json: {statistic: load_statistic, message: :failed}
    end
  end

  def update
    statistic = Statistic.find_by(id: params[:id])
    statistic.update(time_input: params[:time], mass: params[:mass], price: params[:price]) if statistic
    render json: {statistic: load_statistic, message: :success}
  end

  def destroy
    statistic = Statistic.find_by(id: params[:id])
    statistic.destroy if statistic
    render json: {statistic: load_statistic, message: :success}
  end

  private
  def load_statistic
    material = Material.revenue_type.find_by(id: params[:material_id])
    material.statistics
  end

  def set_default_material
    params[:material_id] ||= Material.revenue_type.first.id
  end
end
