class CreateCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name, null: false
      t.string :cnpj, null: false
      t.string :address
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
