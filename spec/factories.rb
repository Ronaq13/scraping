FactoryBot.define do
  factory :url do
    link { "https://#{Faker::Name.unique.name.tr(' ', '-').downcase}.com" }

    factory :url_with_content do
      transient { content_count 2 }
      after(:create) do |url, evaluator|
        create_list(:h_one, evaluator.content_count, url: url)
        create_list(:h_two, evaluator.content_count, url: url)
        create_list(:h_three, evaluator.content_count, url: url)
      end
    end
  end

  factory :h_one do
    content { Faker::Movie.quote }
    url
  end

  factory :h_two do
    content { Faker::Music.instrument }
    url
  end

  factory :h_three do
    content { Faker::SiliconValley.quote }
    url
  end
end
