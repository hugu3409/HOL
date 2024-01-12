# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 全権削除
Classroom.delete_all
Teacher.delete_all
Student.delete_all
Situation.delete_all
Attendance.delete_all


# クラス
c11 = Classroom.create(grade: 1, number: 1, name: "１年１組")
c12 = Classroom.create(grade: 1, number: 2, name: "１年２組")
c13 = Classroom.create(grade: 1, number: 3, name: "１年３組")
c14 = Classroom.create(grade: 1, number: 4, name: "１年４組")
c21 = Classroom.create(grade: 2, number: 1, name: "２年１組")
c22 = Classroom.create(grade: 2, number: 2, name: "２年２組")
c23 = Classroom.create(grade: 2, number: 3, name: "２年３組")
c24 = Classroom.create(grade: 2, number: 4, name: "２年４組")
c31 = Classroom.create(grade: 3, number: 1, name: "３年１組")
c32 = Classroom.create(grade: 3, number: 2, name: "３年２組")
c33 = Classroom.create(grade: 3, number: 3, name: "３年３組")
c34 = Classroom.create(grade: 3, number: 4, name: "３年４組")


# 先生
Teacher.create(teacher_id: "t1", password: "p1", name: "先生１", kanri: true,  classroom_id: c31.id)
Teacher.create(teacher_id: "t2", password: "p2", name: "先生２", kanri: false, classroom_id: nil)


# 生徒
s1 = Student.create(name: "生徒3-1-01", classroom_id: c31.id, number: 1)
s2 = Student.create(name: "生徒3-1-02", classroom_id: c31.id, number: 2)
s3 = Student.create(name: "生徒3-1-03", classroom_id: c31.id, number: 3)
s4 = Student.create(name: "生徒3-1-04", classroom_id: c31.id, number: 4)
s5 = Student.create(name: "生徒3-2-01", classroom_id: c32.id, number: 1)
s6 = Student.create(name: "生徒3-2-02", classroom_id: c32.id, number: 2)


# 出欠区分
s_kesseki = Situation.create(name: "欠席")
s_syuttei = Situation.create(name: "出席停止")
s_chikoku = Situation.create(name: "遅刻")
s_soutai = Situation.create(name: "早退")
s_fumei = Situation.create(name: "不明")

# 出欠情報
base_date = Date.today
Attendance.create(date: base_date,     student_id: s1.id, situation_id: s_kesseki.id, reason: "理由１－１",period_start: base_date - 2, period_end: base_date + 5, comment: "コメント１－１", teacher_id: nil)
Attendance.create(date: base_date - 3, student_id: s1.id, situation_id: s_kesseki.id, reason: "理由１－２", period_start: nil, period_end: nil, comment: "コメント１－２", teacher_id: nil)
Attendance.create(date: base_date - 1, student_id: s1.id, situation_id: s_kesseki.id, reason: "理由１－３", period_start: nil, period_end: nil, comment: "コメント１－３", teacher_id: nil)
Attendance.create(date: base_date + 2, student_id: s1.id, situation_id: s_kesseki.id, reason: "理由１－４", period_start: nil, period_end: nil, comment: "コメント１－４", teacher_id: nil)
Attendance.create(date: base_date + 3, student_id: s1.id, situation_id: s_kesseki.id, reason: "理由１－５", period_start: nil, period_end: nil, comment: "コメント１－５", teacher_id: nil)
Attendance.create(date: base_date - 1, student_id: s2.id, situation_id: s_syuttei.id, reason: "理由２",     period_start: base_date - 2, period_end: base_date + 5, comment: "コメント２", teacher_id: nil)
Attendance.create(date: base_date + 1, student_id: s3.id, situation_id: s_chikoku.id, reason: "理由３",     period_start: nil, period_end: nil, comment: "コメント３", teacher_id: nil)
Attendance.create(date: base_date + 2, student_id: s4.id, situation_id: s_soutai.id,  reason: "理由４",     period_start: nil, period_end: nil, comment: "コメント４", teacher_id: nil)
Attendance.create(date: base_date,     student_id: s5.id, situation_id: s_soutai.id,  reason: "理由５",     period_start: base_date, period_end: nil, comment: "コメント５", teacher_id: nil)
Attendance.create(date: base_date,     student_id: s2.id, situation_id: s_kesseki.id, reason: "理由２－１", period_start: nil, period_end: nil, comment: "コメント２－１", teacher_id: nil)
Attendance.create(date: base_date,     student_id: s6.id, situation_id: s_kesseki.id, reason: "理由５－１", period_start: nil, period_end: base_date, comment: "コメント５－１", teacher_id: nil)
