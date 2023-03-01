class Destination < ApplicationRecord
  belongs_to :purchase, optional: true
end
