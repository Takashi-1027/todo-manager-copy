class Batch::Notification
  def self.send
    Task.all.each do |task|
      diff = task.remind_at.to_date - Date.today
          # p diff.to_i
      # タスクの期日（リマインダー）が近づいたら通知する
      if diff.to_i == 3
        ::Notification.create(task_id: task.id, action: "リマインダー", checked: false) #notification.idは自動的に作られる。
      elsif diff.to_i == 2
        ::Notification.create(task_id: task.id, action: "リマインダー", checked: false)
      elsif diff.to_i == 1
        ::Notification.create(task_id: task.id, action: "リマインダー", checked: false)
      elsif diff.to_i == 0
        ::Notification.create(task_id: task.id, action: "リマインダー", checked: false)
      else
        nil
      end
    end
  end
end