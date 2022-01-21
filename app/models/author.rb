class Author < ApplicationRecord
  belongs_to :resume
  has_rich_text :bio

  def copy_from_last_version
    DuplicationManager::Duplicator.call(klass: Author,
                                        rich_text: 'bio')
  end
end
