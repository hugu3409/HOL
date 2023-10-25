class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :teacher_id
      t.string :password
      t.string :name
      t.boolean :kanri
      t.integer :classroom_id

      t.timestamps
    end
  end
end
