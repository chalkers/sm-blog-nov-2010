class PostsController < ApplicationController

  before_filter :authenticate, :except => [:show, :index]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(:post_id => @post.id)
  end

  def index
    if signed_in?
      @posts = Post.paginate(:page => params[:page], :per_page => 10)
    else
      @posts = Post.published.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
end
