FactoryGirl.define do
  factory :contact do
    firstname { Faker::Name.first_name }
    # firstname "John"
    lastname { Faker::Name.last_name }
    # lastname "Doe"
    email { Faker::Internet.email }
    # sequence(:email) { |n| "johndoe#{n}@example.com"}
    address { Faker::Address.street_address }
    # address "rua sim"
    number { Faker::Number }
    # number 12345

    #after create a contact, assign three diferent phones
    after(:build) do |contact|
      [:home_phone, :work_phone, :mobile_phone].each do |phone|
        contact.phones << FactoryGirl.build(:phone, phone_type: phone, contact: contact)
      end
    end

  end
end
