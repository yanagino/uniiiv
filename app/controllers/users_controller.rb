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
    @reviews = @user.reviews.order(created_at: "DESC")
  end

  def juniors
    @user = User.find_by(uid: params[:uid])
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      flash[:notice] = "プロフィールを編集しました"
      redirect_to("/#{current_user.status}/#{current_user.uid}")
    else
      flash.now[:notice] = "プロフィールを編集できませんでした"
      @reviews = @user.reviews.order(created_at: "DESC")
      render("users/#{@user.status}")
    end

  end

  private
  def user_params
    params.require(:user).permit(:image, :school, :department, :subject, :grade, :content1, :content2, :content3, :content4)
  end

end
