class CreateSkillLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :skill_line_items do |t|
      t.string :name
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
