class TicketsRelation < ROM::Relation[:sql]
  gateway :default

  schema(:tickets, infer: true)

  # define your methods here ie:
  #
  # def all
  #   select(:id, :name).order(:id)
  # end
end
