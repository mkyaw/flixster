FactoryGirl.define do
  factory :course do
    title "Hola"
    description "Hola means hello"
    cost 20
    association :user
  end
end