module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    unless session[:userinfo].present?
      flash[:notice] = 'Please login to access that page.'
      redirect_to '/'
    end

    unless Rodash.get(session[:userinfo], "extra.raw_info.user_metadata.admin")
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
