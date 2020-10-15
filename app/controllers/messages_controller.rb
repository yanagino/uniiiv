class MessagesController < ApplicationController
before_action :require_user_logged_in, :status_regist
before_action :correct_user, only: [:show, :create]

  def index
    #メッセージルームが開設されている人のみ表示（linkモデルのchatがapproveになっている人のみ表示させる）
    if seniors?
      @junior_links = current_user.links_ju.where(chat: "approve").page(params[:page]).order(created_at: "DESC").per(15)
    elsif juniors?
      @senior_links = current_user.links_se.where(chat: "approve").page(params[:page]).order(created_at: "DESC").per(15)
    end
  end

  def show
    @link = Link.find_by(uuid: params[:id])

    @message = @link.messages.build
    @messages = @link.messages

    if current_user.status == "juniors"
      @status = "seniors"
      @user = @link.senior
    elsif current_user.status == "seniors"
      @status = "juniors"
      @user = @link.junior
    end

  end

  def create
    @link = Link.find_by(uuid: params[:id])

    @message = @link.messages.build(message_params)
    @message.source = current_user.status

    if @message.save 
      flash[:success] = "メッセージを送信しました"
      if current_user.status == "juniors"
        @to_user = @link.senior
      elsif current_user.status == "seniors"
        @to_user = @link.junior
      end
      ContactMailer.send_email_message(current_user, @to_user, @link).deliver
      redirect_to("/messages/#{@link.uuid}")
    else
      if current_user.status == "juniors"
        @status = "seniors"
        @user = @link.senior
      elsif current_user.status == "seniors"
        @status = "juniors"
        @user = @link.junior
      end
        flash.now[:danger] = "メッセージの送信に失敗しました"
        @messages = @link.messages.where.not(message: "")
        render("messages/show")
    end
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end

end
