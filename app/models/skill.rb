class Skill < ApplicationRecord
  belongs_to :resume
  has_many :skill_line_items, dependent: :destroy
  accepts_nested_attributes_for :skill_line_items, reject_if: :all_blank, allow_destroy: true

  def copy_from_last_version
    DuplicationManager::Duplicator.call(klass: Skill,
                                        obj: self,
                                        obj_id: :skill_id,
                                        line_items: 'skill_line_items',
                                        new_record: SkillLineItem,
                                        rich_text: 'description')
  end
end
