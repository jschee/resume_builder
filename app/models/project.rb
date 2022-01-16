class Project < ApplicationRecord
  belongs_to :resume
  has_many :project_line_items
  accepts_nested_attributes_for :project_line_items, reject_if: :all_blank, allow_destroy: true
end
