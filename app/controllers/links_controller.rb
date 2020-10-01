class LinksController < ApplicationController
before_action :require_user_logged_in, :status_regist
before_action :status_juniors, only: [:create]
before_action :status_seniors, only: [:approve, :deny]

  def create
    #高校生が申請するメソッド
    #大学生に何らかの通知を送りたい
    @senior = User.where(status: "seniors").find_by(id: params[:senior_id])
    if @senior
      current_user.request(@senior)
      flash[:success] = "申請が完了しました"
      redirect_back(fallback_location: "/")
    else
      flash[:danger] = "申請できませんでした"
      redirect_to("/")
    end
  end

  def approve
    #申請を承認するメソッド
    #高校生に何らかの通知を送りたい
    @junior = User.where(status: "juniors").find_by(uid: params[:id])
    if @junior
      if current_user.status == "seniors"
        @link = current_user.links_ju.find_by(junior_id: @junior.id)
        @link.chat = "approve"
        @link.uuid = SecureRandom.uuid
        @link.save
        flash[:success] = "申請を承認しました"
        redirect_to("/messages/#{@link.uuid}")  
      else
        flash[:danger] = "承認できませんでした"
        redirect_to("/")
      end
    else
      flash[:danger] = "承認できませんでした"
      redirect_to("/")
    end
  end

  def deny
    #申請を否認するメソッド
    #高校生に何らかの通知を送る？
    @junior = User.where(status: "juniors").find_by(uid: params[:id])
    if @junior
      current_user.deny(@junior)
      flash[:success] = "申請を否認しました"
      redirect_back(fallback_location: "/")
    else
      flash[:danger] = "否認できませんでした"
      redirect_to("/")
    end
  end

end
