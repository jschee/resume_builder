class Education < ApplicationRecord
  belongs_to :resume
  has_many :education_line_items
  accepts_nested_attributes_for :education_line_items, reject_if: :all_blank, allow_destroy: true
end
