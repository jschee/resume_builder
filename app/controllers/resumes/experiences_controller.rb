class Resumes::ExperiencesController < ApplicationController
  before_action :set_resume
  before_action :set_experience, only: [:edit, :update]

  def new
    @experience = Experience.new
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

  def experience_params
    params
      .require(:experience)
      .permit(
        :resume_id,
        experience_line_items_attributes: [:_destroy, :name, :title, :start_year, :end_year, :description, :id, :experience_id]
      )
  end
end