class CreateEducationLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :education_line_items do |t|
      t.string :name
      t.string :focus
      t.string :start_year
      t.string :end_year
      t.references :education, null: false, foreign_key: true

      t.timestamps
    end
  end
end
