class CreateInternships < ActiveRecord::Migration[8.0]
  def change
    create_table :internships, id: :uuid do |t|
      t.uuid :company_id, null: false
      t.uuid :student_id, null: false
      t.decimal :salary, precision: 10, scale: 2, null: true
      t.integer :workload, null: true
      t.date :start_date, null: false
      t.date :end_date, null: true
      t.timestamps
    end

    add_foreign_key :internships, :companies, column: :company_id
    add_foreign_key :internships, :students, column: :student_id
    add_index :internships, [ :student_id, :company_id ]
  end
end
