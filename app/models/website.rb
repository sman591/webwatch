class Website < ApplicationRecord
  has_many :screenshots, dependent: :destroy

  validates :url, url: { allow_blank: false }

  def sorted_screenshots
    screenshots.order(created_at: :desc)
  end

  def current_screenshot
    return nil if screenshots.empty?
    sorted.first
  end

  def previous_screenshot
    return nil if screenshots.count < 2
    sorted[1]
  end
end
