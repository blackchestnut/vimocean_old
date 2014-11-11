class DurationPresenter < Keynote::Presenter
  SHORT_TIME_FORMAT = '%H:%M'
  FULL_TIME_FORMAT = '%b %d %H:%M'

  presents :object
  delegate :finished_at, :started_at, to: :object

  def ui
    min = ((finished_at - started_at) / 60).round
    if min < 60
      "#{min}m"
    else
      hours = min / 60
      min % 60 == 0 ? "#{hours}h" : "#{hours}h #{min - (min / 60) * 60}m"
    end
  end

  def height_scale
    scale = ((finished_at - started_at) / 3600).round(1)
    [1, scale].max
  end

  def task_min_height
    (50 * height_scale).to_i
  end

  def interval_ui
    "#{adaptive_ui(started_at)}..#{finished_at.strftime(SHORT_TIME_FORMAT)}"
  end

  def short_interval_ui
    "#{started_at.strftime(SHORT_TIME_FORMAT)}..#{finished_at.strftime(SHORT_TIME_FORMAT)}"
  end

  def adaptive_ui(time)
    format = time.today? ? SHORT_TIME_FORMAT : FULL_TIME_FORMAT
    time.strftime(format)
  end
end
