namespace :db do
  desc    "create genders"
  task    populate_genders:   :environment    do
    Gender.create!(gender: '-')
    Gender.create!(gender: 'male')
    Gender.create!(gender: 'female')
  end

  desc    "create users"
  task    populate_users:   :environment    do
    10.times    do  |n|
      name        =   Faker::Name.name
      email   =   "ad#{n+1}@ad.ad"
      diary_name   =   "Дневник №#{n+1}"
      gender_id = rand(0..2)
      phone = Faker::PhoneNumber.cell_phone
      skype = Faker::Internet.slug
      info = Faker::Lorem.paragraph(7)
      password        =   "qwerty"
      views_diary = Faker::Number.number(3)
      User.create!(   name:  name,
                      email:  email,
                      diary_name:  diary_name,
                      views_diary:  views_diary,
                      gender_id: gender_id,
                      phone: phone,
                      skype: skype,
                      info: info,
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
        body = Faker::Lorem.paragraph(47)
        user.posts.create!(title:  title, body: body)  
      end
    end
  end
end


