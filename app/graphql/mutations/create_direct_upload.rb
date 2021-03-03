# frozen_string_literal: true

module Mutations
  class CreateDirectUpload < GraphQL::Schema::Mutation
    include Rails.application.routes.url_helpers

    argument :input, ::Types::InputObjects::CreateDirectUploadArguments, required: true

    field :direct_upload, ::Types::DirectUploadType, null: false

    def resolve(input:)
      blob = ActiveStorage::Blob.create_before_direct_upload!(filename: input.filename, byte_size: input.byte_size,
                                                              checksum: input.checksum, content_type: input.content_type)

      {
        direct_upload: {
          url: ActiveStorage::Blob.service.path_for(blob.key),
          headers: blob.service_headers_for_direct_upload.to_json,
          blob_id: blob.id,
          signed_blob_id: blob.signed_id
        }
      }
    end
  end
end
