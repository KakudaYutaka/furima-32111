FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    person = Gimei.name
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    kana_last_name { person.last.hiragana }
    kana_first_name { person.first.hiragana }
    birth {Faker::Date.birthday}
  end
end