class Screenshot < ApplicationRecord
  belongs_to :website

  has_attached_file :image, styles: { medium: "348x348>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]
end
