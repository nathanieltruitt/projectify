class Organization < ApplicationRecord
  belongs_to :contacts, class_name: 'Contact', foreign_key: 'primary_contact_id'
  has_many :contacts, class_name: 'Contact', foreign_key: 'organization_id'
  has_many :projects, class_name: 'Project', foreign_key: 'organization_id'
  validates :title, present: true
  validates :primary_contact_id, present: true
end
