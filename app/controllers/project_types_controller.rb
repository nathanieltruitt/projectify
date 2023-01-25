class ProjectTypesController < ApplicationController
  before_action :set_project_type, only: %i[show update destroy]

  def index
    @project_types = ProjectType.all
    render json: @project_types, status: :ok
  end

  def show
    render json: @project_type
  end

  def create
    @project_type = ProjectType.new(project_type_params)
    if @project_type.save
      render json: @project_type, status: :created
    else
      render json: @project_type.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project_type.update(project_type_params)
      render json: @project_type, status: :ok
    else
      render json: @project_type.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project_type.destroy
    head :no_content
  end

  private

  def project_type_params
    params.require(:project_type).permit(:name)
  end

  def set_project_type
    @project_type = ProjectType.find(params[:id])
  end
end
