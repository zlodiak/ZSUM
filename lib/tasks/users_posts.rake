namespace :db do
  desc    "create genders"
  task    populate_genders:   :environment    do
    Gender.create!(gender_name: 'unknown')
    Gender.create!(gender_name: 'male')
    Gender.create!(gender_name: 'female')
  end

  desc    "create users"
  task    populate_users:   :environment    do
      User.create!(   name:  'Админ Админович Админов',
                      email:  'ad@ad.ad',
                      diary_name:  'Мой админский бложик',
                      gender_id: 2,
                      phone: '234-23423-4',
                      skype: 'its_my_skypeg',
                      info: "Князь Василий говорил всегда лениво, как актер говорит роль старой пиесы. Анна Павловна Шерер, напротив, несмотря на свои сорок лет, была преисполнена оживления и порывов.
Быть энтузиасткой сделалось ее общественным положением, и иногда, когда ей даже того не хотелось, она, чтобы не обмануть ожиданий людей, знавших ее, делалась энтузиасткой. Сдержанная улыбка, игравшая постоянно на лице Анны Павловны, хотя и не шла к ее отжившим чертам, выражала, как у избалованных детей, постоянное сознание своего милого недостатка, от которого она не хочет, не может и не находит нужным исправляться.В середине разговора про http://festival.1september.ru/articles/513666/1.jpg политические действия Анна Павловна разгорячилась.— Ах, не говорите мне про Австрию! Я ничего не понимаю, может быть, но Австрия никогда не хотела и не хочет войны. Она предает нас. http://www.magister.msk.ru/library/tolstoy/wp/wp00.htm Россия одна должна быть спасительницей Европы. Наш благодетель знает свое высокое призвание и будет верен ему. Вот одно, во что я верю. Нашему доброму и чудному государю предстоит величайшая роль в мире, и он так добродетелен и хорош, что Бог не оставит его,  и он исполнит свое призвание задавить гидру революции, которая теперь еще ужаснее в лице этого убийцы и злодея. Мы одни должны искупить кровь праведника. На кого нам надеяться, я вас спрашиваю?.. Англия с своим коммерческим духом не поймет http://ilibrary.ru/text/11/p.1/index.html и не может понять всю высоту души императора Александра. Она отказалась очистить Мальту. Она хочет видеть, ищет заднюю мысль наших действий. Что они сказали Новосильцеву? Ничего. Они не поняли, они не могли понять http://www.magister.msk.ru/library/tolstoy/wp/wp00.htm самоотвержения нашего императора, который ничего не хочет для себя и все хочет для блага мира. И что они обещали? Ничего. И что обещали, и того не будет! Пруссия уже объявила, что Бонапарте непобедим и что вся Европа ничего не может против него... И я не верю ни в одном слове ни Гарденбергу, ни Гаугвицу. Cette fameuse neutralité prussienne, ce n'est qu'un piège 9. Я верю в одного Бога и в высокую судьбу нашего милого императора. Он спасет Европу!.. — Она вдруг остановилась с улыбкой насмешки над своею горячностью. трубку  ",
                      admin: true,
                      password:   'qwerty',
                      password_confirmation:  'qwerty')

    23.times    do  |n|
      name = Faker::Name.name
      email = "ad#{n+1}@ad.ad"
      diary_name = Faker::Company.catch_phrase 
      gender_id = rand(1..3)
      phone = Faker::PhoneNumber.cell_phone
      skype = Faker::Internet.slug
      info = Faker::Lorem.paragraph(7)
      password = "qwerty"
      User.create!(   name:  name,
                      email:  email,
                      diary_name:  diary_name,
                      gender_id: gender_id,
                      phone: phone,
                      skype: skype,
                      info: info,
                      admin: nil,
                      password:   password,
                      password_confirmation:  password)
    end
  end

  desc    "create posts"
  task    populate_posts:   :environment    do    
    users = User.all

    users.each do |user|
      15.times  do
        title = Faker::Lorem.sentence(1)
        body =  Faker::Lorem.paragraph(84)
        views = rand(1..4)
        user.posts.create!(title:  title, body: body, views: views)  
      end
    end
  end
end


