namespace :db do
  desc    "create users"
  task    populate_users:   :environment    do
    10.times    do  |n|
      name        =   Faker::Name.name
      email   =   "ad#{n+1}@ad.ad"
      diary_name   =   "Дневник №#{n+1}"
      password        =   "qwerty"
      views_diary = Faker::Number.number(3)
      User.create!(   name:  name,
                      email:  email,
                      diary_name:  diary_name,
                      views_diary:  views_diary,
                      password:   password,
                      password_confirmation:  password)
    end
  end

  desc    "create posts"
  task    populate_posts:   :environment    do    
    users = User.all

    users.each do |user|
      10.times  do
        title = Faker::Lorem.sentence(1)
        body = Faker::Lorem.paragraph(7)
        user.posts.create!(title:  title, body: body)  
      end
    end
  end
end


