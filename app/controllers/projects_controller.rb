class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      respond_to do |format|
        format.html { redirect_to project_url(@project), status: :created, location: @project }
        format.json { render json: @project, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    if @project.update(project_params)
      respond_to do |format|
        format.html { redirect_to project_url(@project), status: :ok, location: @project }
        format.json { render json: @project, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_path, status: :ok }
      format.json { head :no_content }
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :organization_id, :contact_id, :project_type_id, :owner_id, :status_id, :start_date, :end_date)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
