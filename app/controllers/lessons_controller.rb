class LessonsController < ApplicationController
  def index
  end

  def show
    @lesson = get_lesson
  end

  def completed
    @lesson = get_lesson
    @lesson.marked(current_user)
    redirect_to [@lesson.course, @lesson]
  end

  private
  def get_lesson
    Lesson.find(params[:id])
  end
end
