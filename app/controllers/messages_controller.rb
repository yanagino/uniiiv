class MessagesController < ApplicationController
before_action :require_user_logged_in, :status_regist
before_action :correct_user, only: [:show, :create]

  def index
    #メッセージルームが開設されている人のみ表示（linkモデルのchatがapproveになっている人のみ表示させる）
    if seniors?
      @junior_links = current_user.links_ju.where(chat: "approve")
    elsif juniors?
      @senior_links = current_user.links_se.where(chat: "approve")
    end
  end

  def show
    @link = Link.find_by(uuid: params[:id])

    @junior_name = @link.junior.name
    @senior_name = @link.senior.name

    @messages = @link.messages
    @message = @link.messages.build
  end

  def create
    @link = Link.find_by(uuid: params[:id])

    @message = @link.messages.build(message_params)
    @message.source = current_user.status

    if @message.save 
    flash[:notice] = "メッセージを送信しました"
      redirect_to("/messages/#{@link.uuid}")
    else
      flash.now[:notice] = "メッセージの送信に失敗しました"
      @message.source = nil
      @messages = @link.messages
      @junior_name = @link.junior.name
      @senior_name = @link.senior.name
      render("messages/show")
    end
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end

end
