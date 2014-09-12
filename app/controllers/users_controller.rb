class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_filter :authenticate_user!


  def index
    @users = User.all
  end

  def show

  end
  
  def update
    @user = User.find(params[:id])
    if @user.update params.require(:user).permit!
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    unless @user == current_user
      @user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  private
    def set_user
      if params[:id]
        @user = User.find(params[:id])
      else
        @user = current_user
      end
    end

end