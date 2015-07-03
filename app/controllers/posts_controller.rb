class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_action :signed_in_user, only: [:edit, :update, :destroy, :new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy, :new, :create]

  def index
    @user = User.find(params[:user_id])    
    @posts = @user.posts.paginate(page: params[:page], :per_page => 7).order(updated_at: :DESC)

    #if signed_in? && current_user?(@user) || signed_in? && current_user.admin?
    #  @show_actions_own_posts = true
    #else
    #  @show_actions_own_posts = nil
    #end      
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by(id: params[:id])
    @tags = @post.tags

    @post.increment!(:views) if signed_and_not_self?(@user)

    if signed_in? && current_user?(@user) && @post.user_id == current_user.id || signed_in? && current_user.admin?
      @show_actions_own_post = true
    else
      @show_actions_own_post = nil
    end     
  end

  def new    
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def edit
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])    
  end

  def create  
    @post = current_user.posts.build(post_params)

    if @post.save
      add_new_tags(@post)
      flash[:success] = t :post_saved
      redirect_to user_post_path(@current_user, @post)
    else
      flash.now[:error] = t :post_not_saved
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])

    if  @post.update_attributes(post_params)
      add_new_tags(@post)
      flash[:success] = t :post_updated
      redirect_to user_post_path(@user, @post)
    else
      flash[:error] = t :post_not_updated
      render  'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post was successfully destroyed."
    redirect_to user_posts_path
  end

  private
    def correct_user
      @user = User.find(params[:user_id])
      unless  current_user?(@user) || current_user.admin?
        flash[:error] = "no permitted operation"
        redirect_to signin_url
      end     
    end  

    def set_post
      @post = Post.find(params[:id])
    end

    def add_new_tags(post)
      tagnames = params[:tagnames].split(/[, \.?!]+/) 
      tagnames.each do |tagname|
        tag = Tag.find_or_create_by(tagname: tagname.downcase)
        tag.posts << post
      end
    end

    def post_params
      params.require(:post).permit(:title, :body, :tagnames)
    end
end
