class PhasesController < ApplicationController
  before_action :set_phase, only: %i[show update destroy]

  def index
    @phases = Phase.where(project_id: params[:project_id])
    render json: @phases, status: :ok
  end

  def show
    render json: @phase
  end

  def create
    @phase = Phase.new(phase_params)
    if @phase.save
      render json: @phase, status: :created
    else
      render json: @phase.errors, status: :unprocessable_entity
    end
  end

  def update
    if @phase.update(phase_params)
      render json: @phase, status: :ok
    else
      render json: @phase.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @phase.destroy
    head :no_content
  end

  private

  def phase_params
    params.require(:phase).permit(:title, :phase_number, :project_id)
  end

  def set_phase
    @phase = phase.find(params[:id])
  end
end
