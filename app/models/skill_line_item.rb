class SkillLineItem < ApplicationRecord
  belongs_to :skill
  has_rich_text :description

  scope :order_by_created_at, -> { order(created_at: :asc) }
end
