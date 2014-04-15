class LessonsController < ApplicationController
  def index

  end

  def show
    course = Course.find(params[:course_id])
    @lesson = course.lessons.find(params[:id])
  end

  def completed
    course = Course.find(params[:course_id])
    @lesson = course.lessons.find(params[:id])
    if @lesson.isCompleted?(current_user)
      @lesson.mark_as_uncompleted(current_user)
    else
      @lesson.mark_as_completed(current_user)
    end
    redirect_to [course, @lesson]
  end
end
