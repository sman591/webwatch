class ScreenshotJob < ApplicationJob
  queue_as :screenshots

  def perform(*args)
    raise 'not implemented'
  end
end
