class ScreenshotSchedulerJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Website.pluck(:id).each do |website_id|
      next if ScreenshotJob.active?(website_id) || ScreenshotJob.queued?(website_id)
      ScreenshotJob.perform_later(website_id: website_id)
    end
  end
end
