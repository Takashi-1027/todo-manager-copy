class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @user = current_user
    # @notifications = nil
    @notifications = Notification.all
    # @notification = Notification.find(params[:id])
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
    @notifications = current_user.notifications.destroy_all
    redirect_to notifications_path
  end

   private

    def notification_params
      params.require(:notification).permit(:task_id, :action, :checked)
    end

end
