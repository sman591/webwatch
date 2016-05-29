class Website < ApplicationRecord

  validates :url, url: { allow_blank: false }

end
