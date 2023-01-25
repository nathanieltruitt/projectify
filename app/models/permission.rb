class Permission < ApplicationRecord
  validates :title, present: true
end
