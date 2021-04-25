# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# rails_env = Rails.env.to_sym
# rails_root = Rails.root.to_s
# デフォルトは本番環境になる為、明示的に開発環境を指定する
# set :output, 'log/cron.log'  # ログの出力先ファイルを設定
# set :output, "#{rails_root}/log/cron.log"
# env :PATH, ENV['PATH'] # 絶対パスから相対パス指定
# set :environment, :development # 環境を設定


require File.expand_path(File.dirname(__FILE__) + "/environment")
# rails_env = Rails.env.to_sym
# set :environment, rails_env
# set :output, 'log/cron.log'

rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

every 1.days, at: '10:00 pm' do
  begin
    runner "Batch::Notification.send"
  end
end

# every 1.minute do
#   begin
#     runner "Batch::Notification.send"
#   end
# end