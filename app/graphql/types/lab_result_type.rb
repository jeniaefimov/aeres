# frozen_string_literal: true

module Types
  class LabResultType < Types::BaseObject
    field :id, ID, null: false
    field :patient_id, Integer, null: false
    field :test_type, String, null: false
    field :results, GraphQL::Types::JSON, null: true
    field :next_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :file_url, String, null: true

    def file_url
      ::AssociationLoader.for(object.class, file_attachment: :blob).load(object).then do |file|
        next if file.nil?

        Rails.application.routes.url_helpers.url_for(file)
      end
    end
  end
end
