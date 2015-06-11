namespace :db do
  desc    "Fill   database  users has many posts data"
  task    populate_users_posts:   :environment    do
    10.times    do  |n|
            name        =   Faker::Name.name
            email   =   "ad#{n+1}@ad.ad"
            password        =   "qwerty"
            User.create!(   name:  name,
                            email:  email,
                            password:   password,
                            password_confirmation:  password)
    end

    users = User.all
    10.times  do
        title = Faker::Lorem.sentence(1)
        body = Faker::Lorem.paragraph(7)
        users.each  { |user|  user.posts.create!(title:  title, body: body)  }
    end
  end
end