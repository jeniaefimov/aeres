# frozen_string_literal: true

require 'rails_helper'

describe Mutations::CreatePatient, type: :graphql do
  subject { execute_graphql(mutation) }

  let(:user) { create(:user) }

  context "when attributes are valid" do
    let(:mutation) do
      <<~GQL
        mutation {
          createPatient(input: {
            arguments: {
              userId: #{user.id},
              gender: "Male",
              firstName: "Agent",
              lastName: "Smith",
              dateOfBirth: "1991-02-11"
            }
          }) {
            patient {
              userId
            }
            errors
          }
        }
      GQL
    end

    it "returns patient" do
      expect { subject }.to change(Patient, :count).from(0).to(1)
      expect(subject["data"]["createPatient"]["patient"]["userId"]).to eq(user.id)
      expect(subject["data"]["createPatient"]["errors"]).to be_empty
    end
  end

  context "when attributes are invalid" do
    let(:mutation) do
      <<~GQL
        mutation {
          createPatient(input: {
            arguments: {
              firstName: "Agent"
            }
          }) {
            patient {
              userId
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
