class DurationPresenter < Keynote::Presenter
  presents :object

  def ui
    min = ((object.finished_at - object.started_at) / 60).round
    if min < 60
      "#{min}m"
    else
      hours = min / 60
      min % 60 == 0 ? "#{hours}h" : "#{hours}h #{min - (min / 60) * 60}m"
    end
  end

  def height_scale
    scale = ((object.finished_at - object.started_at) / 3600).round(1)
    [1, scale].max
  end

  def task_min_height
    (30 * height_scale).to_i
  end
end
