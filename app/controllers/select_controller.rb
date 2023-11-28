class SelectController < ApplicationController
  def show
    list = Classroom.all.order(:grade, :number)
    @classrooms = list.group_by(&:grade).values
  end
end
