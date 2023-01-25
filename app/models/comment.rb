class Comment < ApplicationRecord
  belongs_to :users, class_name: 'User', foreign_key: 'user_id'
  belongs_to :tasks, class_name: 'Task', foreign_key: 'task_id'
  belongs_to :projects, class_name: 'Project', foreign_key: 'project_id'
  validates :body, present: true
  validates :user_id, present: true
  validates :task_id, present: true
  validates :project_id, present: true
end
