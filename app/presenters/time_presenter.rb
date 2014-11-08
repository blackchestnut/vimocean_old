class TimePresenter < Keynote::Presenter
  presents :time

  def ui
    time.strftime '%Y-%m-%d %H:%M'
  end
end
