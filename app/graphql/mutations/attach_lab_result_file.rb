# frozen_string_literal: true

module Mutations
  class AttachLabResultFile < GraphQL::Schema::Mutation
    description <<~DESC
      Attach file to patient by creating LabResult record
      (by attaching a blob via signed ID)
    DESC

    argument :input, ::Types::InputObjects::AttachLabResultArguments, required: true

    field :lab_result, Types::LabResultType, null: false

    def resolve(input:)
      patient = Patient.find(input.patient_id)
      lab_result = patient.lab_results.create!(test_type: input.test_type, next_at: input.next_at)
      lab_result.file.attach(input.blob_id)
      { lab_result: lab_result }
    end
  end
end
