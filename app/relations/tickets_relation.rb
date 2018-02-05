class TicketsRelation < ROM::Relation[:sql]
  gateway :default

  schema(:tickets, infer: true) do
    associations do
      belongs_to :user
    end
  end

  # define your methods here ie:
  #
  # def all
  #   select(:id, :name).order(:id)
  # end
end
