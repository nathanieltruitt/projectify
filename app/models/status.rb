class Status < ApplicationRecord
  validates :name, present: true
end
