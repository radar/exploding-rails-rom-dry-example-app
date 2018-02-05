class TicketMapper < ROM::Mapper
  relation :tickets

  register_as :ticket

  model Ticket

  attribute :project_id
  attribute :user_id
  attribute :title
  attribute :comment
end
