# frozen_string_literal: true

module Types
  module InputObjects
    class AttachLabResultArguments < GraphQL::Schema::InputObject
      argument :blob_id, String,
               "Signed blob ID generated via `createDirectUpload` mutation",
               required: true
      argument :patient_id, Int, "ID of patient who adds a file to system", required: true
      argument :test_type, String, "Test of type chosen by patient", required: true
      argument :next_at, GraphQL::Types::ISO8601DateTime, "Date and time of the next test", required: false
    end
  end
end
