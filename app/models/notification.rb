class Notification < ApplicationRecord
  belongs_to :task, optional: true

  validates :checked, inclusion: { in: [true, false] }

end
