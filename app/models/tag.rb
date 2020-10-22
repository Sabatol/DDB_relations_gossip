class Tag < ApplicationRecord
  has_many :gossips, through: :go_tags
end
