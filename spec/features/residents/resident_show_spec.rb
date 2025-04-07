require 'rails_helper'

RSpec.describe 'Residents index page', type: :feature do
  before :each do
    @resident_1 = Resident.create!(name: "Colin", age: "36", occupation: "Software Engineer")
    @course_1 = Course.create!(name: "Crime Scenes 101")
    @course_2 = Course.create!(name: "Fingerprinting")
    @resident_course_1 = ResidentCourse.create!(resident_id: @resident_1.id, course_id: @course_1.id)
    @resident_course_2 = ResidentCourse.create!(resident_id: @resident_1.id, course_id: @course_2.id)
  end

  it 'shows list of residents with name age and occupation' do
    visit '/residents'

    expect(page).to have_content("Colin")
    expect(page).to have_content("36")
    expect(page).to have_content("Software Engineer")
  end

  it 'shows residents name and list of courses' do
    visit "/residents/#{@resident_1.id}"

    expect(page).to have_content("Colin")
    expect(page).to have_content("Crime Scenes 101")
    expect(page).to have_content("Fingerprinting")
  end

end
