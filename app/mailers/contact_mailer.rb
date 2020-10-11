class ContactMailer < ApplicationMailer

  def send_email_application(junior, senior)
    @senior = senior
    @junior = junior
    unless @senior.email.nil?
      if @senior.notice == "受信する"
        mail(
          from: 'uniiiv.and@gmail.com',
          to: @senior.email,
          subject: "#{@junior.name}さんから申請が届きました！"
        ) 
      end
    end
  end

  def send_email_approve(junior, senior, link)
    @senior = senior
    @junior = junior
    @link = link
    unless @junior.email.nil?
      if @junior.notice == "受信する"
        mail(
          from: 'uniiiv.and@gmail.com',
          to: @junior.email,
          subject: "#{@senior.name}さんへの申請が承認されました！"
        ) 
      end
    end
  end

  def send_email_message(from_user, to_user, link)
    @from_user = from_user
    @to_user = to_user
    @link = link
    unless @to_user.email.nil?
      if @to_user.notice == "受信する"
        mail(
          from: 'uniiiv.and@gmail.com',
          to: @to_user.email,
          subject: "#{@from_user.name}さんからメッセージが届きました！"
        ) 
      end
    end
  end

end
