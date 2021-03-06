class UsersController < ApplicationController
  before_action :authenticate_user!  # 這個是 devise 提供的方法，先檢查必須登入
  before_action :set_user, :only => [ :show, :edit, :update ]

  def show
    @comments = @user.comments
    @favorites = @user.favorites
    @followings = @user.following
    @followers = @user.followers
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to :action => :show, :id => @user
  end


  protected

  def user_params
    params.require(:user).permit(:firstname, :lastname, :introself, :file_location)
  end

end
