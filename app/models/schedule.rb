class Schedule < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  belongs_to :role

  validates :started_at, presence: true
  validates :finished_at, presence: true

  state_machine :state, initial: :pending do
    state :pending
    state :done
    state :canceled

    event :done do
      transition [:pending, :canceled] => :done
    end

    event :cancel do
      transition [:pending, :done] => :canceled
    end
  end
end
