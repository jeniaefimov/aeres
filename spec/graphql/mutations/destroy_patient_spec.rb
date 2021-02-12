require 'rails_helper'

describe Mutations::DestroyPatient, type: :graphql do
  subject { execute_graphql(mutation) }

  let(:patient) { create(:patient) }
  let(:mutation) do
    <<~GQL
      mutation {
        destroyPatient(input: {
          id: #{patient.id}
        }) {
          id
        }
      }
    GQL
  end

  before do
    patient
  end

  it "return patient id" do
    expect(subject["data"]["destroyPatient"]["id"]).to eq(patient.id.to_s)
  end

  it { expect { subject }.to change(Patient, :count).from(1).to(0) }
end
