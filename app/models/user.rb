class User < ApplicationRecord
  belongs_to :organizations, class_name: 'Organization', foreign_key: 'organization_id'
  belongs_to :permissions, class_name: 'Permission', foreign_key: 'permission_id'
  validates :first_name, present: true
  validates :last_name, present: true
  validates :username, present: true
  validates :email, present: true
  validates :organization_id, present: true
  validates :permission_id, present: true
end
