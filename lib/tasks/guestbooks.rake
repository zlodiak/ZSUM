namespace :db do
  desc    "create guestbooks"
  task    populate_guestbooks:   :environment    do    
    123.times  do
      name = Faker::Name.name
      email = Faker::Internet.email
      body =  Faker::Lorem.paragraph(10)
      user.posts.create!(name:  name, email: email, body: body)  
    end
  end
end


