project_repo = ProjectRepository.new(ROM.env)
ticket_repo = TicketRepository.new(ROM.env)

project = project_repo.create(name: "Exploding Rails")
ticket = ticket_repo.create(
  title: "First errata",
  comment: "I found a boog",
  project_id: project.id
)

p ticket
