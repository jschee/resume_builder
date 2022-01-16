class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end