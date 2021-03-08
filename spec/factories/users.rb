FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nick_name               { Faker::Japanese::Name.last_name }
    email                   { Faker::Internet.free_email }
    password                { Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    last_name               { Faker::Japanese::Name.last_name }
    first_name              { Faker::Japanese::Name.first_name }
    last_kana               { person.last.katakana }
    first_kana              { person.first.katakana }
    date                    { Faker::Date.backward }
  end
end
