class Author < ApplicationRecord
  belongs_to :resume
  has_rich_text :bio
end
