class Task < ApplicationRecord
  belongs_to :user
  # has_many :comments, dependent: :destroy
  has_many :label_maps, dependent: :destroy
  has_many :labels, through: :label_maps
  # has_many :notifications, dependent: :destroy
  validates :title, presence: true
  validate :start_end_check

  # 優先ステータス
  enum priority: {かなりヤバイ: 0, ヤバイ: 1, 普通: 2 , 後でいいや: 3}

  # タスクの進捗ステータス
  enum status: {未着手: 0, 着手中: 1, 保留: 2 , 遅れ: 3 , 完了: 4}

  def save_label(sent_labels)
    current_labels = self.labels.pluck(:label_name) unless self.labels.nil?
    old_labels = current_labels - sent_labels
    new_labels = sent_labels - current_labels

    old_labels.each do |old|
      self.task_labels.delete = Label.find_by(label_name: old)
    end

    new_labels.each do |new|
      new_task_label = Label.find_or_create_by(label_name: new)
      self.task_labels << new_task_label
    end
  end

  def start_end_check
    if start_date.present? && end_date.present?
      if self.start_date > self.end_date
        errors.add(:end_date, "は開始日より前の日付で登録できません。")
      end
    end
  end

end
