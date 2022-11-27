10.times do
  User.create(
    email: Faker::Internet.email,
    password: '12345678',
    crypted_password: '12345678'
  )
end

20.times do
  Note.create(
    user: User.offset(rand(User.count)).first,
    song_title: Faker::Music::RockBand.song,
    singer_name: Faker::Artist.name,
    hashbody: '#サンプル'
  )
end
