# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  has_one :patient, dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email has invalid format" },
                    presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 4, maximum: 254 }
end
