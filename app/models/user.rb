# frozen_string_literal: true

class User < ApplicationRecord
  has_one :patient

  validates :email, presence: true, uniqueness: true
end
