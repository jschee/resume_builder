class Resumes::AuthorsController < ApplicationController
  before_action :set_resume

  def new
    @author = Author.new
  end

  def create
    @author = Author.create!(author_params)
    if @author.save
      redirect_to resume_path(@resume)
    end
  end

  def edit
    @author = @resume.author
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to resume_path(@resume)
    end
  end

  private

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :email, :phone_number, :website, :bio, :title, :resume_id)
  end
end