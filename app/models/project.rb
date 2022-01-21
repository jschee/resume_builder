class Project < ApplicationRecord
  belongs_to :resume
  has_many :project_line_items, dependent: :destroy
  accepts_nested_attributes_for :project_line_items, reject_if: :all_blank, allow_destroy: true

  def copy_from_last_version
    DuplicationManager::Duplicator.call(klass: Project,
                                        obj: self,
                                        obj_id: :project_id,
                                        line_items: 'project_line_items',
                                        new_record: ProjectLineItem,
                                        rich_text: 'description')
  end
end
