require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new course with tutors' do
        expect {
          post courses_path, params: {
            course: {
              name: 'Mathematics',
              duration: 12,
              tutors_attributes: [
                { name: 'John Doe', specialization: 'Algebra' },
                { name: 'Jane Smith', specialization: 'Calculus' }
              ]
            }
          }
        }.to change(Course, :count).by(1)
        expect(response).to have_http_status(:created)
        course = Course.last
        expect(course.name).to eq('Mathematics')
        expect(course.duration).to eq(12)
        expect(course.tutors.count).to eq(2)
        expect(course.tutors.pluck(:name)).to contain_exactly('John Doe', 'Jane Smith')
        expect(course.tutors.pluck(:specialization)).to contain_exactly('Algebra', 'Calculus')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new course' do
        expect {
          post courses_path, params: { course: { name: 'Mathematics' } }
        }.not_to change(Course, :count)
        expect(response).to have_http_status(:unprocessable_entity)
        error_response = JSON.parse(response.body)
        expect(error_response).to have_key('duration')
      end
    end
  end

  describe 'GET #index' do
    it 'returns a list of courses with tutors' do
      course1 = FactoryBot.create(:course, name: 'Mathematics', duration: 12)
      course2 = FactoryBot.create(:course, name: 'Science', duration: 10)
      tutor1 = FactoryBot.create(:tutor, name: 'John Doe', specialization: 'Algebra', course: course1)
      tutor2 = FactoryBot.create(:tutor, name: 'Jane Smith', specialization: 'Physics', course: course2)

      get courses_path

      expect(response).to have_http_status(:ok)
      response_data = JSON.parse(response.body)
      expect(response_data.length).to eq(2)

      expect(response_data[0]['name']).to eq('Mathematics')
      expect(response_data[0]['duration']).to eq(12)
      expect(response_data[0]['tutors'].length).to eq(1)
      expect(response_data[0]['tutors'][0]['name']).to eq('John Doe')
      expect(response_data[0]['tutors'][0]['specialization']).to eq('Algebra')

      expect(response_data[1]['name']).to eq('Science')
      expect(response_data[1]['duration']).to eq(10)
      expect(response_data[1]['tutors'].length).to eq(1)
      expect(response_data[1]['tutors'][0]['name']).to eq('Jane Smith')
      expect(response_data[1]['tutors'][0]['specialization']).to eq('Physics')
    end
  end
end
