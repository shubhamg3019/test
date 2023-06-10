class CoursesController < ApplicationController
  def index
    courses = Course.includes(:tutors)
    render json: courses, include: :tutors
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: course, status: :created
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :duration, tutors_attributes: [:name, :specialization])
  end
end
