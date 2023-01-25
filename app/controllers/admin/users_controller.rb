module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy]

    def index
      @users = User.all
    end
  
    def show
    end
  
    def new
      @user = User.new
    end
  
    def edit
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        respond_to do |format|
          format.html { redirect_to user_url(@user), status: :created, location: @user }
          format.json { render json: @user, status: :created }
        end
      else
        respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity}
        end
      end
    end
  
    def update
      if @user.update(user_params)
        respond_to do |format|
          format.html { redirect_to user_url(@user), status: :ok, location: @user }
          format.json { render json: @user, status: :ok }
        end
      else
        respond_to do |format|
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_path, status: :ok }
        format.json { head :no_content }
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:title, :organization_id, :contact_id, :user_type_id, :owner_id, :status_id, :start_date, :end_date)
    end
  
    def set_user
      @user = User.find(params[:id])
    end
  end
end
