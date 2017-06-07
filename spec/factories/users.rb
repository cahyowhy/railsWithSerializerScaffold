FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    jk 'Pria'
    height { Faker::Number.positive(from=150, to=170) }
    weight { Faker::Number.positive(from=30, to=90) }
    profilepic {Faker::Internet.domain_name}
    birthdate {Faker::Time.birthday(min_age=12, max_age=40)}
    password 'foobar'
  end
end
