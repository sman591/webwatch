class ScreenshotJob < ApplicationJob
  queue_as :screenshots

  def perform(*args)
    return if ScreenshotJob.queued?

    Website.all.each do |website|
      file = Tempfile.new(["screenshot-#{website.id}", ".png"])
      begin
        webshot.capture website.url, file.path, width: 900, height: 562, quality: 85
        screenshot = Screenshot.new
        screenshot.website = website
        screenshot.image = open(file.path)
        screenshot.save!
      ensure
        file.close
        file.unlink   # deletes the temp file
      end
    end
  end

  def webshot
    @webshot ||= Webshot::Screenshot.instance
  end

  def self.queued?
    return true if Sidekiq::Queue.new("screenshots").size > 0

    workers = Sidekiq::Workers.new
    workers.size # => 2
    workers.each do |process_id, thread_id, work|
      return true if work['queue'] == "screenshots"
    end

    false
  end
end
