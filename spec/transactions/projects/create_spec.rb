require "rails_helper"

describe Projects::Create do
  context "the whole thing" do
    let(:repo) { double(:repo) }
    before { allow(subject).to receive(:project_repo) { repo } }

    context "when valid parameters are given" do
      let(:input) { { name: "Test Project" } }

      it "creates a project" do
        expect(repo).to receive(:create).with(input)
        result = subject.(input)
        expect(result).to be_success
      end
    end

    context "when invalid parameters are given" do
      let(:input) { { } }

      it "fails to create a project" do
        expect(repo).not_to receive(:create).with(input)
        result = subject.(input)
        expect(result).to be_a_failure
      end
    end
  end

  context "validate" do
    context "when validation is successful" do
      it "returns the project parameters" do
        input = { name: "Test Project" }
        result = subject.validate(input)
        expect(result).to be_success
        expect(result.value).to eq(input)
      end
    end

    context "when validation fails" do
      it "returns validation errors" do
        input = { }
        result = subject.validate(input)
        expect(result).to be_failure
        expect(result.value).to eq({name: ["is missing"]})
      end
    end
  end

  context "persist" do
    let(:repo) { double(:repo) }
    before { allow(subject).to receive(:project_repo) { repo } }

    it "step is successful" do
      project = double(:project)
      expect(repo).to receive(:create).with(name: "Test Project") { project }
      subject.persist({name: "Test Project"})
    end
  end
end
