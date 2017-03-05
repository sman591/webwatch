include ChunkyPNG::Color

class ScreendiffJob < ApplicationJob
  queue_as :low

  def perform(args)
    website_id = args[:website_id]
    website = Website.find(website_id)
    return unless website

    screenshots = [
      website.current_screenshot,
      website.previous_screenshot
    ]

    return if screenshots[1].blank?

    tmp_files = []
    images = []
    begin
      screenshots.each_with_index do |screenshot, index|
        tmp_files << Tempfile.new(["screenshot-#{screenshot.id}", ".png"])
        screenshot.image.copy_to_local_file(:original, tmp_files[index].path)
        images << ChunkyPNG::Image.from_file(tmp_files[index])
      end

      output = ChunkyPNG::Image.new(images.first.width, images.last.width, WHITE)

      diff = []

      images.first.height.times do |y|
        images.first.row(y).each_with_index do |pixel, x|
          next if pixel == images.last[x, y]
          score = Math.sqrt(
            (r(images.last[x, y]) - r(pixel))**2 +
            (g(images.last[x, y]) - g(pixel))**2 +
            (b(images.last[x, y]) - b(pixel))**2
          ) / Math.sqrt(MAX**2 * 3)

          output[x, y] = grayscale(MAX - (score * MAX).round)
          diff << score
        end
      end

      diff_percent = ((diff.inject { |acc, elem| acc + elem } || 0) / images.first.pixels.length) * 100

      if diff_percent <= Screenshot::DIFF_IGNORE_THRESHOLD
        diff_image = nil
      else
        tmp_files << Tempfile.new(["screendiff-#{screenshots[0].id}", ".png"])
        output.save(tmp_files.last.path)
        diff_image = open(tmp_files.last.path)
      end

      screenshots[0].submit_diff(diff_image, diff_percent)
    ensure
      tmp_files.map(&:close)
      tmp_files.map(&:unlink) # deletes the temp file
    end
  end
end
