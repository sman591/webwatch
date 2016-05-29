class ScreenshotJob < ApplicationJob
  queue_as :screenshots

  def perform(args)
    website = Website.find(args[:website_id])
    return if not website

    ws = Webshot::Screenshot.instance
    file = Tempfile.new(["screenshot-#{website.id}", ".png"])
    begin
      ws.capture website.url, file.path, width: 900, height: 562, quality: 85
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
