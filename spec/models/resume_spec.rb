require 'rails_helper'

RSpec.describe Resume, type: :model do
  describe 'resume' do
    it 'validates presence of name' do
      resume = Resume.new(description: "First version of Resume")
      resume.valid?
      expect(resume.errors[:name]).to include("can't be blank")
    end

    describe 'after_create callback' do
      before { @resume = Resume.create!(name: "My first resume", description: "First version of my resume") }
      it 'will call create_associations' do
        allow(@resume).to receive(:create_associations)
      end
    end

    describe '#create_associations' do
      it 'creates other associated models' do
        expect {
          Resume.create!(name: "My first resume", description: "First version of my resume")
        }.to change(Author, :count).from(0).to(1).and \
          change(Project, :count).from(0).to(1).and \
          change(Experience, :count).from(0).to(1).and \
          change(Skill, :count).from(0).to(1).and \
          change(Education, :count).from(0).to(1)
      end
    end
  end
end