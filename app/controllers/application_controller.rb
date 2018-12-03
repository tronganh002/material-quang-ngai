class ApplicationController < ActionController::Base
  rescue_from ActionController::RoutingError, :with => :render_404

  protected
  def verify_admin
    render json: nil
    return if request.format.json?
    redirect_to root_path unless current_user.nil? && current_user.admin?
  end

  private
  def render_404(exception = nil)
    if exception
        logger.info "Rendering 404: #{exception.message}"
    end

    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

end
