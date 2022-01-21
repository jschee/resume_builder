class Experience < ApplicationRecord
  belongs_to :resume
  has_many :experience_line_items, dependent: :destroy
  accepts_nested_attributes_for :experience_line_items, reject_if: :all_blank, allow_destroy: true

  def copy_from_last_version
    DuplicationManager::Duplicator.call(klass: Experience,
                                        obj: self,
                                        obj_id: :experience_id,
                                        line_items: 'experience_line_items',
                                        new_record: ExperienceLineItem,
                                        rich_text: 'description')
  end
end
