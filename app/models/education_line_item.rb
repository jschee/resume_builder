class EducationLineItem < ApplicationRecord
  belongs_to :education
  has_rich_text :description
end
