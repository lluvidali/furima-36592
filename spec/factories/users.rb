FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(mix_case: false)
    password {password}
    password_confirmation {password}
    nickname {Faker::Name.name}
    first_name_kanji { person.first.kanji }
    family_name_kanji { person.last.kanji }
    first_name_kana { person.first.katakana }
    family_name_kana { person.last.katakana }
    birthday { Faker::Date.backward}
  end
end