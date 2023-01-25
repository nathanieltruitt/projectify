class Task < ApplicationRecord
  belongs_to :projects, class_name: 'Project', foreign_key: 'project_id'
  belongs_to :phases, class_name: 'Phase', foreign_key: 'phase_id'
  belongs_to :users, class_name: 'User', foreign_key: 'collaborator_id'
  belongs_to :contacts, class_name: 'Contact', foreign_key: 'contact_id'
  validates :title, present: true
  validates :project_id, present: true
  validates :phase_id, present: true
  validates :collaborator_id, present: true
  validates :contact_id, present: true
  validates :issue, present: true
end
