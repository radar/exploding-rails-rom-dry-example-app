class TicketRepository < ROM::Repository::Root
  root :tickets

  commands :create, update: :by_pk, delete: :by_pk, mapper: :ticket
end
