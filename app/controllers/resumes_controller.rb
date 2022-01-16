class ResumesController < ApplicationController
  before_action :set_resume
  include Groverable

  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.create(resume_params)
    if @resume.save
      redirect_to resumes_path
    end
  end

  def show
    respond_to do |format|
      format.pdf { download_resume }
    end
  end

  private

  def set_resume
    @resume = Resume.find_by(id: params[:id])
  end

  def resume_params
    params.require(:resume).permit(:name, :description)
  end

  def download_resume
    render_pdf(ResumesController, 'resumes/show', @resume)
  end
end