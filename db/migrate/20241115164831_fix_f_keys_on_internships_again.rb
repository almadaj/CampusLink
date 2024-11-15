class FixFKeysOnInternshipsAgain < ActiveRecord::Migration[8.0]
  def change
    # Remover a chave estrangeira incorreta
    remove_foreign_key :internships, :students, column: :id

    # Adicionar a chave estrangeira correta
    add_foreign_key :internships, :students, column: :student_id
  end
end
