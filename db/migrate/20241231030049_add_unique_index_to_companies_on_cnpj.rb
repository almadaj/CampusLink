class AddUniqueIndexToCompaniesOnCnpj < ActiveRecord::Migration[8.0]
  def change
    add_index :companies, :cnpj, unique: true
  end
end
