class ResidentCourse < ApplicationRecord
  has_many :residents
  has_many :courses

  belongs_to :resident
  belongs_to :course
end
