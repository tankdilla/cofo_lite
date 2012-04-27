FactoryGirl.define do
  factory :song do
    sequence(:id) {|n| n}
    note_id 1
    tempo "Moderate"
    time_signature "4/4"
  end
  
  factory :measure do
    sequence(:id) {|n| n}
    association :song
  end
  
  factory :measure_note do
    sequence(:id) {|n| n}
    note_id 1
    octave_number 1
    position 1
    note_type_id 1
    association :measure
  end
end