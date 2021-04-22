class Batch::Notification
  def self.notification
    Task.all.each do |task|
      # タスクの期日（リマインダー）が近づいたら通知する
      if task.remind_at - Date.today == '3'
        Notification.create(action: "リマインダー", status: "未読")
      elsif task.remind_at - Date.today == '2'
        Notification.create(action: "リマインダー", status: "未読")
      elsif task.remind_at - Date.today == '1'
        Notification.create(action: "リマインダー", status: "未読")
      elsif task.remind_at - Date.today == '0'
        Notification.create(action: "リマインダー", status: "未読")
      end
    end
  end
end