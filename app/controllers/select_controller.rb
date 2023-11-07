class SelectController < ApplicationController
  def show
    @classrooms = Classroom.all
  end
end
