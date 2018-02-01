class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    repo.create(project_params)
    flash[:notice] = "Project has been created."
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name).to_h.symbolize_keys
  end

  def repo
    ProjectRepository.new(ROM.env)
  end
end
