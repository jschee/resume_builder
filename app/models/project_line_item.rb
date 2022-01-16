class ProjectLineItem < ApplicationRecord
  belongs_to :project
  has_rich_text :description

  scope :order_by_created_at, -> { order(created_at: :asc) }
end
