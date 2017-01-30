class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
    @user = current_user
    @ski_instructors = Instructor.where(instructor_type: 'ski')
    @snb_instructors = Instructor.where(instructor_type: 'snowboard')
  end

  def ski_instructors
    @instructors = Instructor.all
    @user = current_user
    @ski_instructors = Instructor.where(instructor_type: 'ski')
  end

  def snb_instructors
    @instructors = Instructor.all
    @user = current_user
    @snb_instructors = Instructor.where(instructor_type: 'snowboard')
  end

  def show
    @instructor = Instructor.find(params[:id])
    @user = current_user
  end

  def pom
    @instructor = Instructor.find(params[:id])
  end

  private

    def instructor_params
      params.require(:instructor).permit(:name, :instructor_type)
    end
end
