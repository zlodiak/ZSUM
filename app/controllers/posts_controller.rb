class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user_post, only: [:edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])    
    @posts = @user.posts.paginate(page: params[:page], :per_page => 7)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by(id: params[:id])   
  end

  def new
    @post = Post.new
  end

  def edit
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id]) 
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    if  @post.update_attributes(post_params)
      flash[:success] = "post_ updated"
      redirect_to user_post_path(@user, @post)
    else
      flash[:error] = "post  updated failed"
      render  'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post was successfully destroyed."
    redirect_to user_posts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
