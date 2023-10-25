class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.date :date
      t.integer :student_id
      t.integer :situation_id
      t.string :reason
      t.date :period_start
      t.date :period_end
      t.string :comment
      t.integer :teacher_id

      t.timestamps
    end
  end
end
