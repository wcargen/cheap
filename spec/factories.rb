FactoryGirl.define do
  factory :user do
    name      "Wes Cargen"
    email     "user@example.com"
    password  "foobar"
    password_confirmation "foobar"
  end
end