module Admin
  class PermissionsController < ApplicationController
    before_action :set_permission, only: %i[show edit update destroy]
  
    def index
      @permissions = Permission.all
    end
  
    def show
    end
  
    def new
      @permission = Permission.new
    end
  
    def edit
    end
  
    def create
      @permission = Permission.new(permission_params)
      if @permission.save
        respond_to do |format|
          format.html { redirect_to permission_url(@permission), status: :created, location: @permission }
          format.json { render json: @permission, status: :created }
        end
      else
        respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @permission.errors, status: :unprocessable_entity}
        end
      end
    end
  
    def update
      if @permission.update(permission_params)
        respond_to do |format|
          format.html { redirect_to permission_url(@permission), status: :ok, location: @permission }
          format.json { render json: @permission, status: :ok }
        end
      else
        respond_to do |format|
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @permission.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @permission.destroy
      respond_to do |format|
        format.html { redirect_to permissions_path, status: :ok }
        format.json { head :no_content }
      end
    end
  
    private
  
    def permission_params
      params.require(:permission).permit(:title, :organization_id, :contact_id, :permission_type_id, :owner_id, :status_id, :start_date, :end_date)
    end
  
    def set_permission
      @permission = Permission.find(params[:id])
    end
  end
end

