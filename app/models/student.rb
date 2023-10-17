class Student < ApplicationRecord
  belongs_to :project
  validates_presence_of :name, :url , :project_id
end
