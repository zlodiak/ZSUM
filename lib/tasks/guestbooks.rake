namespace :db do
  desc    "create guestbooks"
  task    populate_guestbooks:   :environment    do    
    123.times  do
      Guestbook.create(
        name:  name = Faker::Name.name, 
        email: email = Faker::Internet.email, 
        body: body =  Faker::Lorem.paragraph(10)
      ) 
    end
  end
end


