class Task < ApplicationRecord
  belongs_to :user
  # has_many :comments, dependent: :destroy
  # has_many :label_maps, dependent: :destroy
  # has_many :notifications, dependent: :destroy
  validates :title, presence: true
  validate :start_end_check

  # 優先ステータス
  enum priority: {かなりヤバイ: 0, ヤバイ: 1, 普通: 2 , 後でもいい: 3}

  # タスクの進捗ステータス
  enum status: {未着手: 0, 着手中: 1, 保留: 2 , 遅れ: 3 , 完了: 4}



  def start_end_check
    if start_date.present? && end_date.present?
      if self.start_date > self.end_date
        errors.add(:end_date, "は開始日より前の日付で登録できません。")
      end
    end
  end

end
