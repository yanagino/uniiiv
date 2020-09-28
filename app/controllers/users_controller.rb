class UsersController < ApplicationController
before_action :require_user_logged_in
before_action :status_regist, only: [:index, :seniors, :juniors]
  
  def index
    if juniors?
      @links = current_user.links_se.order(created_at: "DESC")
    elsif seniors?
      @links = current_user.links_ju.order(created_at: "DESC")
    end
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

    if params[:status]
      @user.status = params[:status]
      if @user.update(user_params) 
        flash[:notice] = "登録が完了しました"
        redirect_to("/#{@user.status}/#{@user.uid}")
      else
        flash.now[:notice] = "登録できませんでした"
        render("sessions/status")
      end
    else
      if @user.update(user_params) 
        flash[:notice] = "プロフィールを編集しました"
        redirect_to("/#{@user.status}/#{@user.uid}")
      else
        flash.now[:notice] = "プロフィールの編集に失敗しました"
        @reviews = @user.reviews.order(created_at: "DESC")
        render("users/#{@user.status}")
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :school, :department, :subject, :grade, :content1, :content2, :content3, :content4)
  end

end
