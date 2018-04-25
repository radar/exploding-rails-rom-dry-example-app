repo = ProjectRepository.new(ROM.env)
project = repo.all.first
puts project.class.to_s == "Projects::Project"
puts project.respond_to?(:to_model)
