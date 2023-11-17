class AttendanceListController < ApplicationController
  def show
    @situations = Situation.all  #どのテーブル使うか
    @attendances = Attendance.all

    @classrooms = Classroom.all.order(:grade, :number) #コントローラーで学年、クラス順に並べてプルダウンに表示できるようになる(Id順じゃない)
    @classroom_id = params[:classroom_id]
    @today = Date.today

    #@students = Student.all
    @students = Student.where(:classroom_id => params[:classroom_id]).order(number: :asc)
  end

  def select_classroom
    @classrooms = Classroom.all
    @teachers = Teacher.all #classroom_idのみ使いたい
  end
end
