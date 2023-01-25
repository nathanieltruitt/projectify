module Admin
  class OrganizationsController < ApplicationController
    before_action :set_organization, only: %i[show edit update destroy]
    
      def index
        @organizations = Organization.all
      end
    
      def show
      end
    
      def new
        @organization = Organization.new
      end
    
      def edit
      end
    
      def create
        @organization = Organization.new(organization_params)
        if @organization.save
          respond_to do |format|
            format.html { redirect_to organization_url(@organization), status: :created, location: @organization }
            format.json { render json: @organization, status: :created }
          end
        else
          respond_to do |format|
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @organization.errors, status: :unprocessable_entity}
          end
        end
      end
    
      def update
        if @organization.update(organization_params)
          respond_to do |format|
            format.html { redirect_to organization_url(@organization), status: :ok, location: @organization }
            format.json { render json: @organization, status: :ok }
          end
        else
          respond_to do |format|
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @organization.errors, status: :unprocessable_entity }
          end
        end
      end
    
      def destroy
        @organization.destroy
        respond_to do |format|
          format.html { redirect_to Organization_path, status: :ok }
          format.json { head :no_content }
        end
      end
    
      private
    
      def organization_params
        params.require(:organization).permit(:title, :organization_id, :contact_id, :organization_type_id, :owner_id, :status_id, :start_date, :end_date)
      end
    
      def set_organization
        @organization = Organization.find(params[:id])
      end
  end
end

