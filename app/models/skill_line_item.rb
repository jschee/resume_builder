class SkillLineItem < ApplicationRecord
  belongs_to :skill
  has_rich_text :description
end
