class Api::V1::ProjectsController < ApiController
  before_action :set_project, only: %i[show update destroy]

  def index
    @projects = current_user.projects.all.order(created_at: :desc)
  end

  def show
    render :show
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      render :show, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      render :show
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title)
  end
end
