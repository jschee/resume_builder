class CreateProjectLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :project_line_items do |t|
      t.string :name
      t.string :start_year
      t.string :end_year
      t.text :tools
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
