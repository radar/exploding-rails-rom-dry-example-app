class ProjectsController < ApplicationController
  def index
    @projects = repo.all
  end

  def show
    @project = repo.by_id(params[:id])
  end

  def new
    @project = Project.new
  end


  def create
    validation = ProjectSchema.(project_params)
    if validation.success?
      repo.create(project_params)
      flash[:notice] = "Project has been created."
      redirect_to projects_path
    else
      @project = Project.new(project_params)
      @errors = validation.errors
      flash.now[:alert] = "Project could not be created."
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name).to_h.symbolize_keys
  end

  def repo
    ProjectRepository.new(ROM.env)
  end
end
