class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  scope :order_by_created_at, -> { order(created_at: :asc) }
end
