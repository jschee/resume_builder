# frozen_string_literal: true

class Education < ApplicationRecord
  belongs_to :resume
  has_many :education_line_items, dependent: :destroy
  accepts_nested_attributes_for :education_line_items, reject_if: :all_blank, allow_destroy: true

  def copy_from_last_version
    DuplicationManager::Duplicator.call(klass: Education,
                                        obj: self,
                                        obj_id: :education_id,
                                        line_items: 'education_line_items',
                                        new_record: EducationLineItem,
                                        rich_text: 'description')
  end
end