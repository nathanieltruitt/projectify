class StatusesController < ApplicationController
  before_action :set_status, only: %i[show update destroy]

  def index
    @statuses = Status.all
    render json: @statuses, status: :ok
  end

  def show
    render json: @status
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      render json: @status, status: :created
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  def update
    if @status.update(status_params)
      render json: @status, status: :ok
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @status.destroy
    head :no_content
  end

  private

  def status_params
    params.require(:status).permit(:name)
  end

  def set_status
    @status = Status.find(params[:id])
  end
end
