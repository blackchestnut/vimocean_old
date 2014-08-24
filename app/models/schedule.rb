class Schedule < ActiveRecord::Base
  belongs_to :task

  validates :started_at, presence: true
  validates :finished_at, presence: true
end
