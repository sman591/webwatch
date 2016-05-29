class ScreenshotSchedulerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Website.pluck(:id).each do |website_id|
      next if ScreenshotJob.is_active?(website_id) || ScreenshotJob.is_queued?(website_id)
      ScreenshotJob.perform_later(website_id: website_id)
    end
  end
end
