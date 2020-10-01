class HomesController < ApplicationController
  def top
    @users = User.where(status: "seniors").where.not(school: nil).where.not(school: "").order(created_at: "DESC").page(params[:page]).per(15)
  end

  def search
    @keyword = params[:keyword]

    unless @keyword == ""
      @users = User.where(status: "seniors").where("school LIKE (?) OR department LIKE (?) OR subject LIKE (?) OR content1 LIKE (?) OR content2 LIKE (?) OR content3 LIKE (?) OR content4 LIKE (?)", "%#{@keyword}%", "%#{@keyword}%", "%#{@keyword}%", "%#{@keyword}%", "%#{@keyword}%", "%#{@keyword}%", "%#{@keyword}%").order(created_at: "DESC").page(params[:page]).per(15)
      render("homes/top")
    else
      flash[:notice] = "キーワードが入力されていません"
      redirect_to("/")
    end

    
  end

end
