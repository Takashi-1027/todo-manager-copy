class Notification < ApplicationRecord
  belongs_to :task, optional: true

  def reminder
    if task.remind_at - Date.today == '3'
      puts "3日前ですよ！"
    elsif task.remind_at - Date.today == '2'
      puts "2日前ですよ！"
    elsif task.remind_at - Date.today == '1'
      puts "1日前ですよ！"
    elsif task.remind_at - Date.today == '0'
      puts "当日ですよ！"
    end
  end
end
