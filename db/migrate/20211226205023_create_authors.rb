class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :website
      t.references :resume, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
