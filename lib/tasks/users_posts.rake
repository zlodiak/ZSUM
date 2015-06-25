namespace :db do
  desc    "create genders"
  task    populate_genders:   :environment    do
    Gender.create!(gender_name: '-')
    Gender.create!(gender_name: 'male')
    Gender.create!(gender_name: 'female')
  end

  desc    "create users"
  task    populate_users:   :environment    do
      User.create!(   name:  'admin',
                      email:  'ad@ad.ad',
                      diary_name:  'Мой админский бложик',
                      views_diary:  4,
                      gender_id: 2,
                      phone: '234-23423-4',
                      skype: 'ererer',
                      info: 'Моя бабушка курит трубку',
                      admin: true,
                      password:   'qwerty',
                      password_confirmation:  'qwerty')

    3.times    do  |n|
      name = Faker::Name.name
      email = "ad#{n+1}@ad.ad"
      diary_name = Faker::Company.catch_phrase 
      gender_id = rand(1..3)
      phone = Faker::PhoneNumber.cell_phone
      skype = Faker::Internet.slug
      info = Faker::Lorem.paragraph(7)
      password = "qwerty"
      views_diary = Faker::Number.number(1)
      User.create!(   name:  name,
                      email:  email,
                      diary_name:  diary_name,
                      views_diary:  views_diary,
                      gender_id: gender_id,
                      phone: phone,
                      skype: skype,
                      info: info,
                      admin: false,
                      password:   password,
                      password_confirmation:  password)
    end
  end

  desc    "create posts"
  task    populate_posts:   :environment    do    
    users = User.all

    users.each do |user|
      5.times  do
        title = Faker::Lorem.sentence(1)
        body =  Faker::Lorem.paragraph(67)
        views = rand(1..4)
        user.posts.create!(title:  title, body: body, views: views)  
      end
    end
  end
end


