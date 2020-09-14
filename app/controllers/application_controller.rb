class ApplicationController < ActionController::Base
  include SessionsHelper

  #ログインしていないユーザーを容赦無くTOP画面にぶっ飛ばすメソッド
  #アクセスされたくないURLに用いる
  def require_user_logged_in
    unless logged_in?
      flash[:notice] = "ログインが必要です"
      redirect_to("/")
    end
  end

  #ログインユーザーがログイン画面や新規登録画面に来たときに、マイページまでぶっ飛ばすメソッド。そこまで使う頻度ない？
  def forbid_logged_in_user
    if logged_in?
      flash[:notice] = "すでにログインしています"
      redirect_to("/")
    end
  end

  #他人に紐づくチャットルームにアクセスしようとしたときに発動するメソッド
  def correct_user
    @link = Link.find_by(uuid: params[:id])
    unless @link.junior_id == current_user.id || @link.senior_id == current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end

  #ログインしているかつstatus未登録ユーザーを、/statusに飛ばす
  def status_regist
    if logged_in?
      unless status_resigned?
        flash[:notice] = "ステータスを登録してください"
        redirect_to("/status")
      end
    end
  end

  #ログインしているかつstatus登録ユーザーと未ログインユーザーを、/statusに入らせない
  def forbid_status_registed_user
    if logged_in?
      if status_resigned?
        flash[:notice] = "すでにステータスを登録しています"
        redirect_to("/#{current_user.status}/#{current_user.uid}")
      end
    end
  end

  #ログインしているかつ高校生ユーザーのみ、申請できる
  def status_juniors
    if seniors?
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end

  #ログインしているかつ大学生ユーザーのみ、回答できる
  def status_seniors
    if juniors?
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end

end
