class TimePresenter < Keynote::Presenter
  presents :time

  def ui
    time.strftime '%Y-%m-%d %H:%M'
  end

  def date_ui
    time.strftime '%Y-%m-%d'
  end

  def time_ui
    time.strftime '%H:%M'
  end
end
