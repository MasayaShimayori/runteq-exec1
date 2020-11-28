# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!( first_name: 'hoge',
               last_name: 'hoge',
                   email: 'hoge@user.com',
                password: 'hoge',
   password_confirmation: 'hoge' )

User.create!( first_name: 'hoge',
               last_name: 'hoge',
                   email: 'hoge2@user.com',
                password: 'hoge',
   password_confirmation: 'hoge' )


10.times do |n|
  first_name   = Faker::Name.first_name  
  last_name   = Faker::Name.last_name  
  email  = Faker::Internet.email
  password = "12345678"
  User.create!( first_name: first_name,
                 last_name: last_name,
                     email: email,
                  password: password,
     password_confirmation: password ) 
end

20.times do
  user = User.offset(rand(User.count)).first
  title = "hogehoge"
  body = "hogehogehogehoge"
  image = open("./app/assets/images/board_placeholder.png")
  user.boards.create!( title: title, body: body, image: image )
end

