namespace :db do
  desc    "create guestbooks"
  task    populate_guestbooks:   :environment    do    
    30.times  do
      Guestbook.create(
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        message: Faker::Lorem.paragraph(10)
      ) 
    end

    users = User.all.limit(30)
    users.each do |user|
      Guestbook.create(
        user_id: user.id,
        email: user.email, 
        message: Faker::Lorem.paragraph(10)
      ) 
    end    
  end
end


