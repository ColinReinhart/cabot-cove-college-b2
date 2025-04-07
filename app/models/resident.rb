class Resident < ApplicationRecord
  has_many :resident_courses
  has_many :courses, through: :resident_courses, source: :course

  validates :age, presence: true
  validates :name, presence: true
  validates :occupation, presence: true

  def courses
    Course.where(id: ResidentCourse.where(resident_id: id).pluck(:course_id))
  end

end
