# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_patient, mutation: Mutations::CreatePatient
    field :update_patient, mutation: Mutations::UpdatePatient
    field :destroy_patient, mutation: Mutations::DestroyPatient
  end
end
