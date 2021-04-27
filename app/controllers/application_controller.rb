class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_notifications

  def check_notifications
    tasks = Task.where(user_id: current_user).pluck(:id)
    @notifications = Notification.where(task_id: tasks)
  end

  protected

  #サインイン後の遷移パス
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  #サインアウト後の遷移パス
  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
