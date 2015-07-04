namespace :db do
  desc    "create recalls"
  task    :populate_recalls => :environment    do    
    30.times  do
      Recall.create(
        name: Faker::Name.name, 
        message: Faker::Lorem.paragraph(10)
      ) 

      user = User.find(rand(1..20))
      if user 
        Recall.create(
          name: '',
          user_id: user.id,
          message: Faker::Lorem.paragraph(10)
        )       
      end 
    end     
  end
end




