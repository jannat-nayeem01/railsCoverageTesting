class Project < ApplicationRecord
    has_many:students
    validates_presence_of :title, :url
end
