class Resumes::ProjectsController < ApplicationController
  before_action :set_resume
  before_action :set_project, only: [:edit, :update]
  before_action :duplicate, only: :edit

  def new
    @project = Project.new
  end

  def create
    @project = Project.create!(project_params)
    if @project.save
      redirect_to resume_path(@resume)
    end
  end

  def edit;end

  def update
    if @project.update(project_params)
      redirect_to resume_path(@resume)
    else
      render :edit
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def duplicate
    if params[:duplicate].present?
      @project.copy_from_last_version
    end
  end

  def project_params
    params
      .require(:project)
      .permit(
        :resume_id,
        project_line_items_attributes: [:_destroy, :name, :description, :start_year, :end_year, :tools, :id, :project_id]
      )
  end
end