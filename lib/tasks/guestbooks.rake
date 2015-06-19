namespace :db do
  desc    "create guestbooks"
  task    populate_guestbooks:   :environment    do    
    123.times  do
      Guestbook.create(
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        message: Faker::Lorem.paragraph(10)
      ) 
    end
  end
end


