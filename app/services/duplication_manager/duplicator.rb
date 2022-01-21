require "active_support/core_ext/array/access"

module DuplicationManager
  class Duplicator < ApplicationService
    def initialize(attr)
      @klass = attr[:klass]
      @obj = attr[:obj]
      @obj_id = attr[:obj_id]
      @line_items = attr[:line_items]
      @new_record = attr[:new_record]
      @rich_text = attr[:rich_text]
    end

    def call
      if @line_items.present?
        duplicate_line_items
      else
        duplicate_author
      end
    end

    private

    def duplicate_line_items
      @klass.second_to_last.send(@line_items).each do |x|
        attr = x.dup.attributes.keep_if { |_k, v| v }
        attr[@obj_id] = @obj.id
        eli = @new_record.new(attr) # instantiate new item
        eli.send(@rich_text).body = x.send(@rich_text).body # duplicating action_text body
        eli.description.record_id = eli.id # Referencing correct record_id
        eli.save
      end
    end

    def duplicate_author
      last_resume = Resume.second_to_last
      author = Author.last
      attr = last_resume.author.dup.attributes.keep_if { |_k, v| v }
      attr["resume_id"] = Resume.last.id
      author.attributes = attr
      author.send(@rich_text).body = last_resume.author.send(@rich_text).body
      author.bio.record_id = author.id
      author.save
    end
  end
end