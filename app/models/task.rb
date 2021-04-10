class Task < ApplicationRecord
  belongs_to :user
  # has_many :comments, dependent: :destroy
  has_many :label_maps, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # 優先ステータス
  enum priority: {最優先: 0, 優先: 1, 準優先: 2 , 低優先: 3}

  # タスクの進捗ステータス
  enum status: {未着手: 0, 着手中: 1, 保留: 2 , 遅れ: 3 , 完了: 4}
end
