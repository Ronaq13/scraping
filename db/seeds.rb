Url.destroy_all
puts 'Cleaned the database'

Url.create!(
  link: "https://#{Faker::Name.unique.name.tr(' ', '-').downcase}.com"
)
puts 'One URL object is created'

2.times do
  HOne.create!(
    content: Faker::Movie.quote,
    url_id: Url.first.id
  )
  HTwo.create!(
    content: Faker::Music.instrument,
    url_id: Url.first.id
  )
  HThree.create!(
    content: Faker::SiliconValley.quote,
    url_id: Url.first.id
  )
end
puts 'Two h1, h2, and h3 are created which are associated to the first object of URL model'