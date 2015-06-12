namespace :db do
  desc    "create users"
  task    populate_users:   :environment    do
    10.times    do  |n|
      name        =   Faker::Name.name
      email   =   "ad#{n+1}@ad.ad"
      diary_name   =   "Дневник №#{n+1}"
      password        =   "qwerty"
      User.create!(   name:  name,
                      email:  email,
                      diary_name:  diary_name,
                      password:   password,
                      password_confirmation:  password)
    end
  end

  desc    "create posts"
  task    populate_posts:   :environment    do
    users = User.all
    10.times  do
      title = Faker::Lorem.sentence(1)
      body = Faker::Lorem.paragraph(7)
      users.each  { |user|  user.posts.create!(title:  title, body: body)  }
    end
  end
end