class ScheduledTaskForm
  include ActiveModel::Model

  delegate :name, to: :task
  delegate :started_at, :finished_at, to: :schedule

  validates :name, presence: true
  validates :started_at, presence: true
  validates :finished_at, presence: true

  def initialize user
    @user = user
  end

  def submit params
    task.attributes = params.slice :name
    schedule.attributes = params.slice :started_at, :finished_at
    if valid?
      task_db = Task.find_by(user_id: @user, name: task.name) || task
      task_db.schedules << schedule
      task_db.user = @user
      task_db.save!
      true
    else
      false
    end
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Task')
  end

  def persisted?
    false
  end

  def task
    @task ||= Task.new
  end

  def schedule
    @schedule ||= Schedule.new
  end
end
