class ProjectRepository < ROM::Repository::Root
  root :projects

  commands :create, update: :by_pk, delete: :by_pk, mapper: :project

  def all
    projects.all
  end

  def by_id(id)
    projects.by_pk(id).one!
  end

  def by_id_with_tickets(id)
    projects.by_pk(id).combine(:tickets).one!
  end

  def by_id_with_tickets_and_users(id)
    projects.by_pk(id).combine(tickets: :user).one!
  end

  private

  def projects
    super.map_to(Project)
  end
end
