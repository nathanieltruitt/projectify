class Project < ApplicationRecord
  belongs_to :organizations, class_name: 'Organization', foreign_key: 'organization_id'
  belongs_to :users, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :contacts, class_name: 'Contact', foreign_key: 'contact_id'
  belongs_to :statuses, class_name: 'Status', foreign_key: 'status_id'
  belongs_to :project_types, class_name: 'ProjectType', foreign_key: 'project_type_id'
  validates :title, present: true
  validates :organization_id, present: true
  validates :contact_id, present: true
  validates :project_type_id, present: true
  validates :owner_id, present: true
  validates :status_id, present: true
end
