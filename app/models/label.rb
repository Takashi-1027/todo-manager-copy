class Label < ApplicationRecord
  has_many :label_maps, dependent: :destroy, foreign_key: 'label_id'
  has_many :tasks, through: :label_maps
end
