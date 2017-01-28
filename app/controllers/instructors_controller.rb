class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
    @ski_instructors = Instructor.where(instructor_type: 'ski')
    @snb_instructors = Instructor.where(instructor_type: 'snowboard')
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  private

    def instructor_params
      params.require(:instructor).permit(:name, :instructor_type)
    end
end
