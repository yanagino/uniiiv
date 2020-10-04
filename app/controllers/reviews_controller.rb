class ReviewsController < ApplicationController
before_action :require_user_logged_in, :status_juniors
before_action :review_user_uid, only: [:new, :edit]
before_action :review_user_id, only: [:update, :destroy]

  def new
    @senior = User.find_by(uid: params[:id])
    @review = @senior.reviews.build
  end

  def create
    @review = current_user.reviewings.build(review_params)
    @senior = User.find_by(id: params[:review][:senior_id])
    @review.senior_id = @senior.id
    @link = Link.find_by(senior_id: @senior.id, chat: "approve", junior_id: current_user.id)

    if @link.blank?
      flash[:notice] = "権限がありません"
      redirect_to("/")
    else
      if @review.save
        flash[:success] = "レビューを投稿しました"
        redirect_to("/seniors/#{@senior.uid}")
      else
        flash.now[:danger] = "レビューの投稿に失敗しました"
        render("reviews/new")
      end
    end
    
  end

  def edit
    @senior = User.find_by(uid: params[:id])
    @review = @senior.reviews.find_by(junior_id: current_user.id)
  end

  def update
    @senior = User.find_by(id: params[:review][:senior_id])
    @review = current_user.reviewings.find_by(senior_id: @senior.id)

    if @review.update(review_params)
      flash[:success] = "レビューを編集しました"
      redirect_to("/seniors/#{@senior.uid}")
    else
      flash.now[:danger] = "レビューの編集に失敗しました"
      render("reviews/edit")
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    if @review.destroy
      flash[:success] = "レビューを削除しました"
      redirect_back(fallback_location: "/")
    else
      flash.now[:danger] = "レビューの削除に失敗しました"
      render("users/seniors")
    end
  end

  private
  def review_params
    params.require(:review).permit(:star, :content)
  end
end
