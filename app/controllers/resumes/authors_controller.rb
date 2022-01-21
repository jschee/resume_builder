class Resumes::AuthorsController < ApplicationController
  before_action :set_resume
  before_action :set_author, only: [:edit, :update]
  before_action :duplicate, only: :edit

  def new
    @author = Author.new
  end

  def create
    @author = Author.create!(author_params)
    if @author.save
      redirect_to resume_path(@resume)
    end
  end

  def edit; end

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

  def set_author
    @author = Author.find(params[:id])
  end

  def duplicate
    if params[:duplicate].present?
      @author.copy_from_last_version
      redirect_to edit_resume_author_path(@resume, @author)
    end
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :email, :phone_number, :website, :bio, :title, :resume_id)
  end
end