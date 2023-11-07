class CreateClassrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :classrooms do |t|
      t.integer :grade
      t.integer :number
      t.string :name

      t.timestamps
    end
  end
end
