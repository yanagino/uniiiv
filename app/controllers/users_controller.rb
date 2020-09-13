class UsersController < ApplicationController
before_action :require_user_logged_in, :status_regist
  
  def ju_index
    @users = User.where(status: "juniors")
  end

  def se_index
    @users = User.where(status: "seniors")
  end

  def seniors
    @user = User.find_by(uid: params[:uid])
  end

  def juniors
    @user = User.find_by(uid: params[:uid])
  end
end
