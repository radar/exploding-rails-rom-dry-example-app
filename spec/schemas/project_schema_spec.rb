require 'rails_helper'

describe ProjectSchema do
  let(:result) { subject.call(attributes) }

  context "when a name is specified" do
    let(:attributes) { { name: "Test Project" } }

    it "is valid" do
      expect(result).to be_success
    end
  end

  context "when a name is not specified" do
    let(:attributes) { { } }

    it "is invalid" do
      expect(result).to be_failure
      expect(result.errors[:name]).to eq(["is missing"])
    end
  end
end
