class PrintController < ApplicationController
  def show
    # 基準日の取得
    @base_date = params[:base_date]
    @base_date = Date.today unless @base_date.present?

    # 出欠一覧に戻る際のクラス情報
    @current_classroom_id = params[:classroom_id]
    @current_classroom_id = Classroom.first unless @current_classroom_id.present?

    # 学年・クラスの取得
    @classroom = Classroom.all.order(:grade, :number).group_by(&:grade)

    # 年・出欠種別をキー、件数を値としたハッシュを作成
    @attendance_count_hash = {}
    @classroom.keys.each do |grade|
      @attendance_count_hash[grade] = {}
      Situation::TARGET_ID_LIST.each do |s|
        @attendance_count_hash[grade][s] = 1
      end
    end

    # 基準日の学年・クラス・出欠種別ごとの出欠件数を取得
    attendances1 = Attendance.select("classrooms.grade as grade, attendances.situation_id, classrooms.number as class_number, count(*) AS cnt").joins(student: :classroom).where(date: @base_date).group("classrooms.grade, attendances.situation_id, classrooms.number")

    # 学年・出欠種別の件数ハッシュを作成
    attendances1.each do |a|
      if @attendance_count_hash[a.grade][a.situation_id] < a.cnt
        @attendance_count_hash[a.grade][a.situation_id] = a.cnt
      end
    end

    # 出欠種別の切り替え行となる配列を作成
    @situation_header_row = [0]
    @attendance_count_hash.keys.each do |grade|
      @attendance_count_hash[grade].keys.each do |s|
        @situation_header_row << @situation_header_row.last + @attendance_count_hash[grade][s]
      end
    end

    # 年・:count_sammaryをキーとして合計件数を追加
    # 学年の切り替え行となる配列を作成
    @grade_header_row = [0]
    @attendance_count_hash.keys.each do |grade|
      @attendance_count_hash[grade][:count_sammary] = @attendance_count_hash[grade].values.inject(&:+)
      @grade_header_row << @grade_header_row.last + @attendance_count_hash[grade][:count_sammary]
    end

    #年・出欠種別をキー、配列を値としたハッシュを作成
    @attendance_hash = {}
    @classroom.keys.each do |grade|
      @attendance_hash[grade] = {}
      Situation::TARGET_ID_LIST.each do |s|
        @attendance_hash[grade][s] = Array.new(@attendance_count_hash[grade][s]) { {} }
      end
    end

    # 基準日の出欠情報を取得
    attendances2 = Attendance.select("attendances.*, classrooms.grade as grade, classrooms.number as number, students.name as student_name").joins(student: :classroom).where(date: @base_date).order(:student_id)

    # 年・出欠種別をキー、配列を値としたハッシュに出欠情報を設定
    attendances2.each do |a|
      max_count = @attendance_count_hash[a.grade][a.situation_id]
      max_count.times do |i|
        if @attendance_hash[a.grade][a.situation_id][i].has_key?(a.number)
          next
        else
          @attendance_hash[a.grade][a.situation_id][i][a.number] = a
          break
        end
      end
    end

    # 値のない箇所をAttendanceの空オブジェクトで埋める
    @attendance_hash.keys.each do |grade|
      @attendance_hash[grade].keys.each do |s|
        @attendance_hash[grade][s].each do |row|
          @classroom[grade].map(&:number).each do |class_number|
            unless row.has_key?(class_number)
              a = Attendance.new
              a.student = Student.new
              row[class_number] = a
            end
          end
        end
      end
    end

  end
end
