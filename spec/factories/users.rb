FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    gimei = Gimei.name
    last_name { gimei.last.kanji }
    first_name { gimei.first.kanji }
    kana_last_name { gimei.last.katakana }
    kana_first_name { gimei.first.katakana }
    birth {Faker::Date.birthday}
  end
end