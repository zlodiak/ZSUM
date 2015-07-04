namespace :db do
  desc "create tags"
  task :populate_tags => :populate_posts do    
    DatabaseCleaner.clean_with(:truncation, :only => ['tags', 'posts_tags'])
    10.times  do |n|
      Tag.create(
        tagname: Faker::Lorem.word + "#{n}"
      ) 
    end     
  end

  desc "create posts_tags"
  task :populate_posts_tags => :populate_tags  do   
    tags = Tag.all 
    600.times do
      tag = Tag.find(rand(1..10))
      post = Post.find(rand(1..360))
      tag.posts << post
    end

   
  end  
end




