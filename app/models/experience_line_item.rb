class ExperienceLineItem < ApplicationRecord
  belongs_to :experience
  has_rich_text :description
end
