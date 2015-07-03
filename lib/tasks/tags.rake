namespace :db do
  desc "create tags"
  task populate_tags:   :environment    do    
    DatabaseCleaner.clean_with(:truncation, :only => ['tags', 'posts_tags'])
    10.times  do |n|
      Tag.create(
        tagname: Faker::Lorem.word + "#{n}"
      ) 
    end     
  end

  desc "create posts_tags"
  task populate_posts_tags:   :environment    do    
    posts = Post.all
    posts.each do |post|
      tag = Tag.find(rand(1..10))
      tag.posts << post
    end

   
  end  
end




