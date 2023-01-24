class Contact < ApplicationRecord
  belongs_to :organizations, class_name: 'Organization', foreign_key: 'organization_id'
  validates :first_name, present: true
  validates :last_name, present: true
  validates :email, present: true
  validates :organization_id, present: true
end
