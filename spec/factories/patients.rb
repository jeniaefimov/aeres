# frozen_string_literal: true

FactoryBot.define do
  factory :patient, class: "Patient" do
    first_name { "Agent" }
    last_name { "Smith" }
    date_of_birth { 25.years.ago.iso8601 }
    gender { Users::Constants::MALE }
  end
end
