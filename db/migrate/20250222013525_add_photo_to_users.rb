class AddPhotoToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :photo, :binary
  end
end
