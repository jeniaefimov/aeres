# frozen_string_literal: true

module Mutations
  class AttachLabResultFile < GraphQL::Schema::Mutation
    description <<~DESC
      Attach file to LabResult
      (by attaching a blob via signed ID)
    DESC

    argument :blob_id, String,
             "Signed blob ID generated via `createDirectUpload` mutation",
             required: true
    argument :lab_result_id, Int, required: true

    field :lab_result, Types::LabResultType, null: true

    def resolve(blob_id:, lab_result_id:)
      # Active Storage retrieves the blob data from DB
      # using a signed_id and associates the blob with the attachment (avatar)
      lab_result = current_user.patient.lab_results.find(lab_result_id)
      lab_result.file.attach(blob_id)
      { lab_result: lab_result }
    end
  end
end
