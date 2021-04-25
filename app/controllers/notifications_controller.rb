class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    tasks = Task.where(user_id: current_user).pluck(:id)
    @notifications = Notification.where(task_id: tasks)
  end

  def show
    @notification = Notification.find(params[:id])
    @notification.update(checked: true)
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to notifications_path
  end

  def destroy_all
    # 通知を全削除
    tasks = Task.where(user_id: current_user).pluck(:id)
    @notifications = Notification.where(task_id: tasks)
    @notifications.destroy_all
    redirect_to notifications_path
  end

   private

    def notification_params
      params.require(:notification).permit(:task_id, :action, :checked)
    end

end
