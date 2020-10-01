class SessionsController < ApplicationController
before_action :require_user_logged_in, :forbid_status_registed_user, only: [:status, :juniors, :seniors]

  def create
    data = request.env['omniauth.auth']

    unless data[:uid]
      flash[:danger] = "連携できませんでした"
      redirect_to("/")
    end

    @user = User.find_by(uid: data[:uid])
    if @user && @user.status
      session[:uid] = @user.uid
      @user.save
      flash[:success] = "ログインしました"
      redirect_to("/#{@user.status}/#{@user.uid}")
    elsif @user
      session[:uid] = @user.uid
      @user.save
      flash[:success] = "ログインしました"
      redirect_to("/status")
    else
      @user = User.new(
        uid: data[:uid],
        name: data[:info][:name],
        provider: data[:provider],
      )
      if @user.save
        session[:uid] = @user.uid
        flash[:success] = "ユーザー登録しました"
        redirect_to("/status")
      else
        flash[:danger] = "連携できませんでした"
        redirect_to("/")
      end
    end
  end

  def destroy
    flash[:success] = "ログアウトしました"
    session[:uid] = nil
    redirect_to("/")
  end

  def status
    @user = current_user
  end

  def juniors
    @user = User.find_by(uid: params[:uid])

    if @user
      @user.status = "juniors"
      @user.save
      flash[:success] = "高校生として登録しました"
      redirect_to("/juniors/#{@user.uid}")
    else
      flash[:danger] = "登録できませんでした"
      redirect_to("/")
    end
  end

  def seniors
    @user = User.find_by(uid: params[:uid])

    if @user
      @user.status = "seniors"
      @user.save
      flash[:success] = "大学生として登録しました"
      redirect_to("/seniors/#{@user.uid}")
    else
      flash[:danger] = "登録できませんでした"
      redirect_to("/")
    end
  end

end
