# frozen_string_literal: true

module Types
  class LabResultType < Types::BaseObject
    field :id, ID, null: false
    field :patient_id, Integer, null: false
    field :test_type, String, null: false
    field :file, String, null: false
    field :results, GraphQL::Types::JSON, null: true
    field :next_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
