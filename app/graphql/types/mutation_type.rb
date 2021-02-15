# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_patient, mutation: Mutations::CreatePatient
    field :update_patient, mutation: Mutations::UpdatePatient
    field :destroy_patient, mutation: Mutations::DestroyPatient
    field :create_direct_upload, mutation: ::Mutations::CreateDirectUpload
    field :attach_lab_result_file, mutation: ::Mutations::AttachLabResultFile
  end
end
