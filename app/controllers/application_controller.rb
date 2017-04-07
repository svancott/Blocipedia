class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def require_sign_in
    unless current_user
      flash[:alert] = "You must be logged in to do that"
      redirect_to new_user_session_path
    end
  end

  def upgrade(user)
    user.update_attributes!(role: 'premium')
  end
  # def upgrade_to_premium
  #   current_user.update_attributes!(role: 'premium')
  # end

  # def downgrade_to_standard
  #   current_user.update_attributes!(role: 'standard')
  # end
end
