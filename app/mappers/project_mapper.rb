class ProjectMapper < ROM::Mapper
  relation :projects

  register_as :project

  model Project

  attribute :name
end
