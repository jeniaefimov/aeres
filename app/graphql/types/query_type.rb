# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :patient, Types::PatientType, null: true do
      argument :id, ID, required: true
    end

    def patient(id:)
      Patient.find_by(id: id)
    end
  end
end
