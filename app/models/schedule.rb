class Schedule < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  validates :started_at, presence: true
  validates :finished_at, presence: true
end
