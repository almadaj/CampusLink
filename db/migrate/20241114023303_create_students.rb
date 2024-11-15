class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :id_student
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :course
      t.timestamps
    end
  end
end
