class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def enroll
    course = Course.find(params[:id]) 
    course.add_student(current_user)
    binding.pry
    redirect_to course
  end

end
