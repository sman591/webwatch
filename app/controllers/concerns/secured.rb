module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    unless current_user
      flash[:notice] = 'Please login to access that page.'
      redirect_to root_path
      return false
    end

    unless Rodash.get(current_user, "extra.raw_info.user_metadata.admin")
      flash[:alert] = 'Please contact an administrator to access that page.'
      redirect_to root_path
      return false
    end
  end
end
