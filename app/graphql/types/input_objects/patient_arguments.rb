module Types
  module InputObjects
    class PatientArguments < Types::BaseInputObject
      argument :user_id, Integer, required: true
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :gender, String, required: true
      argument :date_of_birth, GraphQL::Types::ISO8601Date, required: true
      argument :doctor_email, String, required: false
    end
  end
end
