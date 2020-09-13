class PostsController < ApplicationController
before_action :require_user_logged_in, :status_regist

  def index
    @posts = Post.all.order(created_at: "DESC")
    @post = Post.new
  end

  def create
    @post = Post.new(record_params)
    if @post.save
      @posts = Post.all.order(created_at: "DESC")
      flash[:notice] = "投稿できました"
      redirect_to("/posts")
    else
      @posts = Post.all.order(created_at: "DESC")
      flash.now[:notice] = "投稿できませんでした"
      render("posts/index")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to("/posts")
  end
end

private
def record_params
  return params.require(:post).permit(:content)
end

