# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 User.create!(
  email: "tttttt@test.com",
  name: "テスタロウ",
  introduction: "がんばるぞい！",
  password: "999999"
  )

  5.times do |n|
    User.create!(
      email: "test#{n + 1}@test.com",
      name: "赤羽#{n + 1}",
      introduction: "よろしくね！#{n + 1}",
      # profile_image_id: File.open('./app/assets/images/stil-vdaJJbls3xE-unsplash.jpg'),
      password: "password#{n + 1}"
    )
  end