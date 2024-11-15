class AlterStudentTable < ActiveRecord::Migration[8.0]
  def change
    rename_column :students, :id_student, :student_number
  end
end
