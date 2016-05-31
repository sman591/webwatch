class ScreenshotJob < ApplicationJob
  queue_as :screenshots

  @@active_websites = []
  @@webshot = nil

  def perform(args)
    website_id = args[:website_id]
    return if self.class.is_active? website_id
    @@active_websites << website_id
    begin
      website = Website.find(website_id)
      return if not website

      file = Tempfile.new(["screenshot-#{website.id}", ".png"])
      begin
        webshot.capture website.url, file.path, width: 900, height: 562, quality: 85
        screenshot = Screenshot.new
        screenshot.website = website
        screenshot.image = open(file.path)
        screenshot.save!

        ScreendiffJob.perform_later(website_id: website_id)
      ensure
        file.close
        file.unlink   # deletes the temp file
      end
    ensure
      @@active_websites.delete(website_id)
    end
  end

  def webshot
    @@webshot = Webshot::Screenshot.instance
  end

  def self.is_active?(website_id)
    @@active_websites.include? website_id
  end

  def self.is_queued?(website_id)
    queries = [
      Proc.new { Sidekiq::Queue.new(queue_name) },
      Proc.new { Sidekiq::RetrySet.new }
    ]
    queries.any? do |query|
      query.call.any? do |job|
        job = job.args[0]
        job['job_class'] == 'ScreenshotJob' &&
          job['arguments'][0]['website_id'] == website_id
      end
    end
  end
end
