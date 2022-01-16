class AddColumnsToResume < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :name, :string
    add_column :resumes, :description, :text
  end
end
