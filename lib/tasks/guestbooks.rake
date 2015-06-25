namespace :db do
  desc    "create guestbooks"
  task    populate_guestbooks:   :environment    do    
    30.times  do
      Guestbook.create(
        name: Faker::Name.name, 
        message: Faker::Lorem.paragraph(10)
      ) 

      user = User.find(rand(1..20))
      if user 
        Guestbook.create(
          name: '',
          user_id: user.id,
          message: Faker::Lorem.paragraph(10)
        )       
      end 
    end     
  end
end




