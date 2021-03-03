# frozen_string_literal: true

module Mutations
  class CreatePatient < Mutations::BaseMutation
    argument :arguments, Types::InputObjects::PatientArguments, required: true

    field :patient, Types::PatientType, null: true
    field :errors, [String], null: false

    def resolve(arguments:)
      patient = Patient.new(arguments.to_h)
      return { patient: patient, errors: [] } if patient.save

      { errors: patient.errors.full_messages }
    end
  end
end
