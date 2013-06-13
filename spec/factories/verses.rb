# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :verse do
    song_id 1
    line_number 1
    words "MyString"
  end
end
