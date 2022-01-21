class Resumes::ExperiencesController < ApplicationController
  before_action :set_resume
  before_action :set_experience, only: [:edit, :update]
  before_action :duplicate, only: :edit

  def new
    @experience = Experience.new
    if params[:duplicate].present?
      @experience.copy_from_last_version
      if @resume.experience.experience_line_items.present?
        redirect_to edit_resume_experience_path(@resume, @resume.experience)
      end
    end
  end

  def create
    @experience = Experience.create!(experience_params)
    if @experience.save
      redirect_to resume_path(@resume)
    end
  end

  def edit; end

  def update
    if @experience.update(experience_params)
      redirect_to resume_path(@resume)
    else
      render :edit
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def duplicate
    if params[:duplicate].present?
      @experience.copy_from_last_version
    end
  end

  def experience_params
    params
      .require(:experience)
      .permit(
        :resume_id,
        experience_line_items_attributes: [:_destroy, :name, :title, :start_year, :end_year, :description, :id, :experience_id]
      )
  end
end