class AttendanceListController < ApplicationController
  def show
    # クラスの取得
    @classrooms = Classroom.all.order(:grade, :number) #コントローラーで学年、クラス順に並べてプルダウンに表示できるようになる(Id順じゃない)
    @classroom_id = params[:classroom_id]
    
    # 基準日の取得
    @base_date = params[:base_date].to_date if params[:base_date].present? #矢印押したら日付変わるやつ
    @base_date = Date.today unless @base_date.present? #初期値

    @from_date = @base_date - 2
    @to_date = @base_date + 2

    # 指定されたクラスの生徒の取得
    @students = Student.where(classroom_id: @classroom_id).order(:number)
    student_ids = @students.select(:id)

    # 指定されたクラスの生徒の基準日±2日の出欠の取得
    @attendances = Attendance.where(student_id: student_ids).where("date >= ? AND date <= ?", @from_date, @to_date).order(:student_id, :date)
  end

  def edit
    @attendance = Attendance.find_by(date: params[:base_date], student_id: params[:student_id])
    unless @attendance
      @attendance = Attendance.new
      @attendance.date = params[:base_date]
      @attendance.situation = Situation.first
      @attendance.student = Student.find(params[:student_id])
    end
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.save
    redirect_to attendance_list_show_path(@attendance.student.classroom.id, base_date: @attendance.date)
  end

  def update
    @attendance = Attendance.find(params[:attendance][:id])
    @attendance.update(attendance_params)
    redirect_to attendance_list_show_path(@attendance.student.classroom.id, base_date: @attendance.date)
  end

  def delete
    @attendance = Attendance.find(params[:id])
    @attendance.delete
    redirect_to attendance_list_show_path(@attendance.student.classroom.id, base_date: @attendance.date)
  end

  private
  def attendance_params
    params.require(:attendance).permit(:date, :student_id, :situation_id, :reason, :period_start, :period_end, :comment)
  end
end
