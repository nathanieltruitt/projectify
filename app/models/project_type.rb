class ProjectType < ApplicationRecord
  validates :name, present: true
end
