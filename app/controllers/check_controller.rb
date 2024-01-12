class CheckController < ApplicationController
  def show
    @classroom_id = params[:classroom_id]
    @base_date = params[:base_date]

    #attendanceテーブルからデータを取ってくる
    #  [取得条件]
    #　　dateが@base_dateと一致
    #　　@classroom_idに所属する生徒の出欠情報
    #　　　→ student_idが1 or 2 or 3 or 4 or 5
    #　　　　　（Studentテーブルのclassroom_idが@classroom_idと一致するid）
    #  
    #  [取得順]
    #    situation_id
    #    students.number
    #
    #@attendaces = Attendance.joins(:student).where().order(:situation_id, "students.number")
    @attendances = Attendance.joins(:student).where(date: @base_date).where("students.classroom_id = ?", @classroom_id).order(:situation_id, "students.number")
    #joinsは他のテーブルのデータを取ってこれる
    #joins無しだとstudents.numberがテーブルにないので使えない
  end
end
