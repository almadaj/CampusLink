class AddBirthToStudents < ActiveRecord::Migration[8.0]
  def change
    add_column :students, :birth, :date
  end
end
