require 'rails_helper'

RSpec.describe Author, type: :model do
  describe '#copy_from_last_version' do
    before do
      @first_resume = Resume.create!(name: 'First version of resume')
      @second_resume = Resume.create!(name: 'Second version of resume')
      @author = Author.first
      @author.first_name = 'Abba'
      @author.last_name = 'Storm'
      @author.save
    end

    it 'should copy author data from last resume version' do
      @second_resume.author.copy_from_last_version
      @second_resume.author.reload
      expect(@second_resume.author.first_name).to eq('Abba')
      expect(@second_resume.author.last_name).to eq('Storm')
    end
  end
end