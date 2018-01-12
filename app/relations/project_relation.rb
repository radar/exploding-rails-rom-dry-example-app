class ProjectRelation < ROM::Relation[:sql]
  gateway :default

  schema(:projects, infer: true)

  # define your methods here ie:
  #
  # def all
  #   select(:id, :name).order(:id)
  # end
end
