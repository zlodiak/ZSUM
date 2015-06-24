namespace :db do
  desc    "create guestbooks"
  task    populate_guestbooks:   :environment    do    
    30.times  do
      p 111111
      Guestbook.create(
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        message: Faker::Lorem.paragraph(10)
      ) 

      user = User.find(rand(1..20))
      if user 
        p 22222222
        p user.id
        Guestbook.create(
          user_id: user,
          email: user.email, 
          message: Faker::Lorem.paragraph(10)
        )       
      end     
    end     
  end
end




