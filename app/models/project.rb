class Project < ApplicationModel
  attribute :name, Types::Strict::String
  attribute :tickets, Types::Strict::Array.of(Ticket).default([])

  def contributors
    tickets.map(&:user).uniq
  end
end
