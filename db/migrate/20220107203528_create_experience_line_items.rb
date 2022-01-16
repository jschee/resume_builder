class CreateExperienceLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :experience_line_items do |t|
      t.string :name
      t.string :title
      t.string :start_year
      t.string :end_year
      t.references :experience, null: false, foreign_key: true

      t.timestamps
    end
  end
end
