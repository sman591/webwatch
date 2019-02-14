class Screenshot < ApplicationRecord
  belongs_to :website

  has_attached_file :image, styles: { medium: "348x348>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]

  has_attached_file :diff_image, styles: { medium: "348x348>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :image, matches: [/png\Z/]

  after_commit :broadcast_changes

  DIFF_IGNORE_THRESHOLD = 0

  def diff?
    diff_date.present? && diff_percent.present?
  end

  def different?
    diff? && diff_percent >= website.diff_threshold
  end

  def submit_diff(image, percent)
    self.diff_percent = percent
    self.diff_image = image
    self.diff_date = Time.now
    save!

    return unless different?
    ScreenshotsMailer.changed(id).deliver_later
  end

  def previous_screenshot
    website.sorted_screenshots.where('created_at < ?', created_at).first
  end

  private

  def broadcast_changes
    ActionCable.server.broadcast 'screenshots',
                                 screenshot: id,
                                 website: website_id
  end
end
