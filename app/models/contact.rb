class Contact < ApplicationRecord
  belongs_to :organizations, class_name: 'Organization', foreign_key: 'organization_id'
  validates :first_name, present: true
  validates :last_name, present: true
  validates :email, present: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be a valid email address' }
  validates :organization_id, present: true
end
