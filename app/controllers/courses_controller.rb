class CoursesController < ApplicationController
  def index
    @courses = Course.all.includes(:author)
  end

  def show
    @course = Course.find(params[:id])
  end

  def enroll
    course = Course.find(params[:id])
    course.add_student(current_user)
    redirect_to course
  end

end
