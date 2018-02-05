class ProjectRelation < ROM::Relation[:sql]
  gateway :default

  schema(:projects, infer: true) do
    associations do
      has_many :tickets
    end
  end

  def all
    select(:id, :name).order(:id)
  end
end
