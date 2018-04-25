class ProjectRepository < ROM::Repository::Root
  root :projects

  commands :create, update: :by_pk, delete: :by_pk

  struct_namespace Projects

  def all
    projects.all
  end
end
