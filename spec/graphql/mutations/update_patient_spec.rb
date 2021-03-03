# frozen_string_literal: true

require 'rails_helper'

describe Mutations::UpdatePatient, type: :graphql do
  subject { execute_graphql(mutation) }

  let(:user)    { create(:user) }
  let(:patient) { create(:patient, user: user, first_name: first_name) }
  let(:first_name) { "Sam" }

  context "when attributes are valid" do
    let(:updated_first_name) { "Neo" }
    let(:mutation) do
      <<~GQL
        mutation {
          updatePatient(input: {
            id: #{patient.id},
            firstName: "#{updated_first_name}"
          }) {
            patient {
              firstName
            }
            errors
          }
        }
      GQL
    end

    it "return patient" do
      expect(subject["data"]["updatePatient"]["patient"]["firstName"]).to eq(updated_first_name)
      expect(subject["data"]["updatePatient"]["errors"]).to be_empty
    end
  end

  context "when attributes are invalid" do
    let(:mutation) do
      <<~GQL
        mutation {
          updatePatient(input: {
            firstName: "Agent"
          }) {
            patient {
              first_name
            }
            errors
          }
        }
      GQL
    end

    it "returns errors" do
      expect(subject["errors"]).not_to be_empty
    end
  end
end
