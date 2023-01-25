class TasksController < ApplicationController
  def index
    @tasks = Task.where(project_id: params[:project_id])
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      respond_to do |format|
        format.html { redirect_to new_task_path, status: :created, location: @task }
        format.json { render json: @task, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @task.update(task_params)
      respond_to do |format|
        format.html { redirect_to task_path(@task), status: :ok, location: @task }
        format.json { render json: @task, status: :unprocessable_entity }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, status: :ok }
      format.json { head :no_content }
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :project_id, :phase_id, :collaborator_id, :contact_id, :issue)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
