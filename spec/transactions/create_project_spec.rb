require 'rails_helper'

describe CreateProject do
  context "validate" do
    context "when validation is successful" do
      it "step succeeds" do
        input = { name: "Test Project" }
        result = subject.validate(input)
        expect(result).to be_success
        expect(result.value).to eq(input)
      end
    end

    context "when validation fails" do
      it "step fails" do
        input = { }
        result = subject.validate(input)
        expect(result).to be_failure
        expect(result.value).to eq({name: ["is missing"]})
      end
    end
  end

  context "persist" do
    let(:repo) { double(:repo) }
    before { allow(subject).to receive(:repo) { repo } }

    it "step is successful" do
      project = double(:project)
      expect(repo).to receive(:create).with(name: "Test Project") { project }
      subject.persist({name: "Test Project"})
    end
  end
end
