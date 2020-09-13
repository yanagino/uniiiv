class User < ApplicationRecord
  require 'securerandom'
  validates :uid, presence: true, uniqueness: true

  has_many :links_se, class_name: "Link", foreign_key: "junior_id"
  has_many :links_ju, class_name: "Link", foreign_key: "senior_id"
  has_many :seniors, through: :links_se, source: :senior
  has_many :juniors, through: :links_ju, source: :junior

  def request(senior)
    if self.status == "juniors" && senior.status == "seniors"
      self.links_se.find_or_create_by(senior_id: senior.id)
    else
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end

  def approve(junior)
    if self.status == "seniors" && junior.status == "juniors"
      link = self.links_ju.find_by(junior_id: junior.id)
      link.chat = "approve"
      link.uuid = SecureRandom.uuid
      link.save
    else
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end

  def deny(junior)
    if self.status == "seniors" && junior.status == "juniors"
      link = self.links_ju.find_by(junior_id: junior.id)
      link.chat = "deny"
      link.save
    else
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
  
  #高校生が大学生に申請しているか
  #申請していない(false)場合は申請ボタンが有効、申請している(true)場合はボタンが無効になるためのメソッド
  def requesting?(senior)
    self.seniors.include?(senior)
  end

  #大学生が、高校生のページを閲覧する際、その子から申請が来ているかどうかを判断
  #申請されていない(false)場合は回答ボタンが表示なし、申請されている(true)は回答ボタンが現れる。そして↓のメソッドに続く
  def requested?(junior)
    self.juniors.include?(junior)
  end

  #大学生が、その高校生の申請ボタンに対し、回答しているかどうかを判断
  #回答している(true)場合は、その回答結果を表示。していない(false)場合は、承認・否認ボタンが有効化
  def answering?(junior)
    link = self.links_ju.find_by(junior_id: junior.id)
    if link.chat == nil
      return "未回答"
    elsif link.chat == "approve"
      return "承認済"
    elsif link.chat == "deny"
      return "否認済"
    end
  end

end
