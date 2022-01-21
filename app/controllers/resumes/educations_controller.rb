class Resumes::EducationsController < ApplicationController
  before_action :set_resume
  before_action :set_education, only: [:edit, :update]
  before_action :duplicate, only: :edit

  def new
    @education = Education.new
  end

  def create
    @education = Education.create!(education_params)
    if @education.save
      redirect_to resume_path(@resume)
    end
  end

  def edit; end

  def update
    if @education.update(education_params)
      redirect_to resume_path(@resume)
    else
      render :edit
    end
  end

  private

  def set_education
    @education = Education.find(params[:id])
  end

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def duplicate
    if params[:duplicate].present?
      @education.copy_from_last_version
    end
  end

  def education_params
    params
      .require(:education)
      .permit(
        :resume_id,
        education_line_items_attributes: [:_destroy, :name, :focus, :start_year, :end_year, :description, :id, :education_id]
      )
  end
end