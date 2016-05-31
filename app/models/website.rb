class Website < ApplicationRecord
  has_many :screenshots, dependent: :destroy

  validates :url, url: { allow_blank: false }

  def current_screenshot
    return nil if screenshots.empty?
    screenshots.order(created_at: :desc).first
  end

  def previous_screenshot
    return nil if screenshots.count < 2
    screenshots.order(created_at: :desc)[1]
  end

end
