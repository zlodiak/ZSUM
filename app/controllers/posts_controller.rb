class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show, :new, :edit, :update]
  before_action :signed_in_user, only: [:edit, :update, :destroy, :new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy, :new, :create]

  def index
    @posts = @user.posts.paginate(page: params[:page], :per_page => 10).order(updated_at: :DESC)     
  end

  def show
    @tags = @post.tags

    @post.increment!(:views) if signed_and_not_self?(@user)

    if signed_in? && current_user?(@user) && @post.user_id == current_user.id || signed_in? && current_user.admin?
      @show_actions_own_post = true
    else
      @show_actions_own_post = nil
    end     
  end

  def new    
    @post = Post.new
  end

  def edit
    @tags = @post.tags
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
    if @post.update_attributes(post_params)
      add_new_tags(@post) if params[:tagnames]
      p '------------------1'
      p params['delete_tags']
      p '------------------2'
      destroy_tags(params['delete_tags'], @post) if params['delete_tags']
      flash[:success] = t :post_updated
      redirect_to user_post_path(@user, @post)
    else
      flash[:error] = t :post_not_updated
      render  'edit'
    end
  end

  def destroy
    @post.destroy
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
      @post = Post.find_by_id(params[:id])
      render_404 unless @post
    end

    def set_user
      @user = User.find_by_id(params[:user_id])
      render_404 unless @user
    end    

    def add_new_tags(post)
      tagnames = params[:tagnames].split(/[, \.?!]+/) 
      tagnames.each do |tagname|
        #tag = Tag.find_or_create_by(tagname: tagname.downcase)
        tag = Tag.find_by(tagname: tagname.downcase)
        if tag
          sql = "select * from 'posts_tags' where post_id = #{post.id} and tag_id = #{tag.id}"
          records_array = ActiveRecord::Base.connection.execute(sql)     
          tag.posts << post if records_array.count == 0
        else
          tag = Tag.create(tagname: tagname.downcase)
          tag.posts << post
        end
      end
    end

    def destroy_tags(tags,post)
      tags.each do |tag|
        sql = "delete from 'posts_tags' where post_id = #{post.id} and tag_id = #{tag}"
        records_array = ActiveRecord::Base.connection.execute(sql)    
      end
    end    

    def post_params
      params.require(:post).permit(:title, :body, :tagnames, :delete_tags)
    end
end
