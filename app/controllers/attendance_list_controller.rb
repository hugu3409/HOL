class AttendanceListController < ApplicationController
  def show
    # クラスの取得
    @classrooms = Classroom.all.order(:grade, :number) #コントローラーで学年、クラス順に並べてプルダウンに表示できるようになる(Id順じゃない)
    @classroom_id = params[:classroom_id]
    
    # 基準日の取得
    @base_date = params[:base_date].to_date if params[:base_date].present?
    @base_date = Date.today unless @base_date.present?

    @from_date = @base_date - 2
    @to_date = @base_date + 2

    # 指定されたクラスの生徒の取得
    @students = Student.where(classroom_id: @classroom_id).order(:number)
    student_ids = @students.select(:id)

    # 指定されたクラスの生徒の基準日±2日の出欠の取得
    @attendances = Attendance.where(student_id: student_ids).where("date >= ? AND date <= ?", @from_date, @to_date).order(:student_id, :date)
  end

  def select_classroom
    @classrooms = Classroom.all
    @teachers = Teacher.all #classroom_idのみ使いたい
  end
end
