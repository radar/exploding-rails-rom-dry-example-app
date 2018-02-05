require "rails_helper"

describe Project do
  context "#contributors" do
    it "returns a unique list of contributors" do
      user_1 = { username: "radar" }
      user_2 = { username: "not-radar" }
      tickets = [
        { user: user_1 },
        { user: user_1 },
        { user: user_2 }
      ]

      project = Project.new(tickets: tickets)
      contributors = project.contributors.map(&:username)
      expect(contributors.count).to eq(2)
      expect(contributors).to include("radar")
      expect(contributors).to include("not-radar")
    end
  end
end
