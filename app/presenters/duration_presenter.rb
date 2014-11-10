class DurationPresenter < Keynote::Presenter
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
    (30 * height_scale).to_i
  end

  def interval_ui
    "#{adaptive_ui(started_at)}..#{finished_at.strftime('%H:%M')}"
  end

  def adaptive_ui(time)
    format = time.today? ? '%H:%M' : '%b %d %H:%M'
    time.strftime(format)
  end
end
