class AttendanceListController < ApplicationController
  def show
    @situations = Situation.all  #どのテーブル使うか
    @attendances = Attendance.all
    @classroom_id = params[:classroom_id]
    @today = Date.today
  end

  def select_classroom
    @classrooms = Classroom.all
    @teachers = Teacher.all #classroom_idのみ使いたい
  end
end
