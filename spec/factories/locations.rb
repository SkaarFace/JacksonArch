# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    address_line_1 "MyString"
    address_line_2 "MyString"
    zip_code "MyString"
    state "MyString"
    city "MyString"
    latitude 1.5
    longitude 1.5
  end
end
