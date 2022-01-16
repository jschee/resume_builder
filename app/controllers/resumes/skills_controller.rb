class Resumes::SkillsController < ApplicationController
  before_action :set_resume
  before_action :set_skill, only: [:edit, :update]

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.create!(skill_params)
    if @skill.save
      redirect_to resume_path(@resume)
    end
  end

  def edit; end

  def update
    if @skill.update(skill_params)
      redirect_to resume_path(@resume)
    else
      render :edit
    end
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def skill_params
    params
      .require(:skill)
      .permit(
        :resume_id,
        skill_line_items_attributes: [:_destroy, :name, :description, :id, :skill_id]
      )
  end
end