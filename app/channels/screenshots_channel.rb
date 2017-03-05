class ScreenshotsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "screenshots"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
