class Skill < ApplicationRecord
  belongs_to :resume
  has_many :skill_line_items
  accepts_nested_attributes_for :skill_line_items, reject_if: :all_blank, allow_destroy: true
end
