namespace :db do
  desc    "create guestbooks"
  task    populate_guestbooks:   :environment    do    
    30.times  do
      Guestbook.create(
        name: Faker::Name.name, 
        message: Faker::Lorem.paragraph(10)
      ) 

=begin
      user = User.find(rand(1..20))
      if user 
        Guestbook.create(
          user_id: user,
          message: Faker::Lorem.paragraph(10)
        )       
      end 
=end
  
    end     
  end
end




