module Mutations
  class DestroyPatient < Mutations::BaseMutation
    argument :id, ID, required: true

    field :id, ID, null: true
    field :errors, [String], null: true

    def resolve(id:)
      patient = Patient.find(id)
      patient.destroy!
      { id: id }
    end
  end
end
