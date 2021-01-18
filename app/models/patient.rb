# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :user

  validates :gender, inclusion: Users::Constants::GENDER
end
