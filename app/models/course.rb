class Course < ApplicationRecord
  has_many :resident_courses
  has_many :residents, through: :resident_courses, source: :resident

  validates :name, presence: true
end
