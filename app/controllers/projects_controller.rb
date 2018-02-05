class ProjectsController < ApplicationController
  def index
    @projects = repo.all
  end

  def show
    @project = repo.by_id_with_tickets_and_users(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    transaction = CreateProject.new
    transaction.(project_params) do |result|
      result.success do |project|
        flash[:notice] = "Project has been created."
        redirect_to project
      end

      result.failure :validate do |errors|
        @project = Project.new(project_params)
        @errors = errors
        flash[:alert] = "Project could not be created."
        render :new
      end
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
