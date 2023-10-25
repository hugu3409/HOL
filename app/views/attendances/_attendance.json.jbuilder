json.extract! attendance, :id, :date, :student_id, :situation_id, :reason, :period_start, :period_end, :comment, :teacher_id, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
