class Resume < ApplicationRecord
  has_one :author, dependent: :destroy
  has_one :project, dependent: :destroy
  has_many :project_line_items, through: :project
  has_one :skill, dependent: :destroy
  has_many :skill_line_items, through: :skill
  has_one :experience, dependent: :destroy
  has_many :experience_line_items, through: :experience
  has_one :education, dependent: :destroy
  has_many :education_line_items, through: :education
  after_create :create_associations

  validates :name, presence: :true

  def create_associations
    Author.create!(resume_id: self.id)
    Project.create!(resume_id: self.id)
    Skill.create!(resume_id: self.id)
    Education.create!(resume_id: self.id)
    Experience.create!(resume_id: self.id)
  end
end
