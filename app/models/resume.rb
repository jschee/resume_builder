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

  def create_associations
    Project.create!(resume: self)
    Skill.create!(resume: self)
    Education.create!(resume: self)
    Experience.create!(resume: self)
    Education.create!(resume: self)
  end
end
