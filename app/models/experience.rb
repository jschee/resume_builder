class Experience < ApplicationRecord
  belongs_to :resume
  has_many :experience_line_items
  accepts_nested_attributes_for :experience_line_items, reject_if: :all_blank, allow_destroy: true
end
