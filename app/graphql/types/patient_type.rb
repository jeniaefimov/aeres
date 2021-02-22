# frozen_string_literal: true

module Types
  class PatientType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :date_of_birth, GraphQL::Types::ISO8601Date, null: false
    field :gender, String, null: false
    field :doctor_email, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :lab_results, [Types::LabResultType], null: true
    field :user, Types::UserType, null: false
  end
end
