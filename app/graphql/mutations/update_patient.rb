# frozen_string_literal: true

module Mutations
  class UpdatePatient < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :user_id, Integer, required: false
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :gender, String, required: false
    argument :date_of_birth, GraphQL::Types::ISO8601Date, required: false
    argument :doctor_email, String, required: false

    field :patient, Types::PatientType, null: true
    field :errors, [String], null: false

    def resolve(arguments)
      patient = Patient.find(arguments.fetch(:id))
      return { patient: patient, errors: [] } if patient.update(arguments.to_h)

      { errors: patient.errors.full_messages }
    end
  end
end
