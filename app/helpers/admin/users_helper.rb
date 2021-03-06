module Admin::UsersHelper
  def get_summary_users
    @users_count = ::User.all.count
  end

  def get_summary_posts
    @posts_count = ::Post.all.count
  end  

  def get_summary_recalls
    @recalls_count = ::Recall.all.count
  end    

  def get_summary_admins
    @admins_count = ::User.where(:admin => true).count
  end  

  def get_summary_views
    @admins_count = ::Post.all.sum(:views)
  end 

  def get_summary_tags
    @tags_count = ::Tag.all.count
  end         
end
