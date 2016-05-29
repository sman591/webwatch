class Website < ApplicationRecord
  has_many :screenshots, dependent: :destroy

  validates :url, url: { allow_blank: false }

end
