FactoryBot.define do
  factory :patient, class: "Patient" do
    user
    first_name { "Agent" }
    last_name { "Smith" }
    date_of_birth { 25.years.ago.iso8601 }
    gender { Users::Constants::MALE }
  end
end
