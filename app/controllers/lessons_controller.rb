class LessonsController < ApplicationController
  def index

  end

  def show
   # binding.pry
    course = Course.find(params[:course_id])
    @lesson = course.lessons.find(params[:id])
  end
end
