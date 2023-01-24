class Phase < ApplicationRecord
  belongs_to :projects, class_name: 'Project', foreign_key: 'project_id'
  validates :title, present: true
  validates :phase_number, present: true
  validates :project_id, present: true
end
