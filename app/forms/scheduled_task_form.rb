class ScheduledTaskForm
  include ActiveModel::Model

  delegate :name, to: :task
  delegate :id, :role_id, :started_at, :finished_at, to: :schedule
  alias :started_on :started_at

  validates :name, presence: true
  validates :role_id, presence: true
  validates :started_on, presence: true
  validates :started_at, presence: true
  validates :finished_at, presence: true

  def initialize user, schedule=nil
    @user = user
    @schedule = schedule
    @task = schedule.try(:task)
  end

  def submit params
    task(params[:name]).attributes = params.slice(:name)
    started_at = Time.zone.parse("#{params[:started_on]} #{params[:started_at]}")
    finished_at = Time.zone.parse("#{params[:started_on]} #{params[:finished_at]}")
    schedule(params[:id]).attributes = params.slice(:role_id).merge({ started_at: started_at, finished_at: finished_at })
    if valid?
      schedule.task = task
      schedule.save!
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

  def task name=nil
    @task ||= (@user.tasks.find_by(name: name) if name) || Task.new(user: @user)
  end

  def schedule id=nil
    @schedule ||= if id.present?
      @user.schedules.find(id)
    else
      Schedule.new(user: @user, state: :pending, started_at: Time.zone.now, finished_at: Time.zone.now)
    end
  end
end
