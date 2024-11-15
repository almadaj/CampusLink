class FixFKeysOnInternships < ActiveRecord::Migration[8.0]
  def change
    # Corrigir a chave estrangeira de student_id
    add_foreign_key :internships, :students, column: :student_id

    # Corrigir a chave estrangeira de company_id
    remove_foreign_key :internships, column: :company_id
    add_foreign_key :internships, :companies, column: :company_id
  end
end
