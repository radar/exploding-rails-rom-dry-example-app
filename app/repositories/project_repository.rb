puts "BEING LOADED"

class ProjectRepository < ROM::Repository::Root
  root :projects

  commands :create, update: :by_pk, delete: :by_pk, mapper: :project
end
