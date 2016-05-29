class Website < ApplicationRecord
  has_many :screenshots

  validates :url, url: { allow_blank: false }

end
