# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: "User" do
    email { "user_#{SecureRandom.hex}@test.com" }
    password { "pa$$w0rd" }
  end
end
