class UsersController < ApplicationController
before_action :require_user_logged_in, :status_regist
  
  def index
    if juniors?
      @links = current_user.links_se.order(created_at: "DESC")
    elsif seniors?
      @links = current_user.links_ju.order(created_at: "DESC")
    end
  end

  def ju_index
    @users = User.where(status: "juniors")
  end

  def se_index
    @users = User.where(status: "seniors")
  end

  def seniors
    @user = User.find_by(uid: params[:uid])
    @reviews = @user.reviews
  end

  def juniors
    @user = User.find_by(uid: params[:uid])
  end
end
