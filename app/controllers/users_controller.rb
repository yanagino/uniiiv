class UsersController < ApplicationController
before_action :require_user_logged_in 
before_action :status_regist, only: [:index, :seniors, :juniors, :destroy]
  
  def index
    if juniors?
      @links = current_user.links_se.order(created_at: "DESC").page(params[:page]).per(9)
    elsif seniors?
      @links = current_user.links_ju.order(created_at: "DESC").page(params[:page]).per(9)
    end
  end

  def seniors
    @user = User.find_by(uid: params[:uid])
    @reviews = @user.reviews.order(created_at: "DESC").page(params[:page]).per(5)
    @count = @reviews.total_count
  end

  def juniors
    @user = User.find_by(uid: params[:uid])
  end

  def update
    @user = User.find_by(id: params[:id])

    if params[:status]
      @user.status = params[:status]
      if @user.update(user_params) 
        flash[:success] = "登録が完了しました"
        redirect_to("/#{@user.status}/#{@user.uid}")
      else
        flash.now[:danger] = "登録できませんでした"
        render("sessions/status")
      end
    else
      if params[:user]
        if @user.update(user_params) 
          flash[:success] = "プロフィールを編集しました"
          redirect_to("/#{@user.status}/#{@user.uid}")
        else
          flash.now[:danger] = "プロフィールの編集に失敗しました"
          @reviews = @user.reviews.order(created_at: "DESC").page(params[:page]).per(5)
          render("users/#{@user.status}")
        end
      else
        flash.now[:danger] = "プロフィールの編集に失敗しました"
        @reviews = @user.reviews.order(created_at: "DESC").page(params[:page]).per(5)
        render("users/#{@user.status}")
      end
    end
  end

  def destroy
    @user = User.find_by(uid: params[:id])

    if @user.destroy
      flash[:success] = "退会が完了しました"
      redirect_to("/")
    else
      flash[:danger] = "エラーが発生しました"
      redirect_back(fallback_location: "/")
    end
  end

  private
  def user_params
    unless params[:user].nil?
      params.require(:user).permit(:name, :image, :school, :department, :subject, :grade, :content1, :content2, :content3, :content4, :email, :notice)
    end
  end

end
