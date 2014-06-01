class Schedule < ActiveRecord::Base
  belongs_to :task

  validates :started_at, presence: true
  validates :duration, presence: true, default: 1
  validates :priority, presence: true, default: 0
end
