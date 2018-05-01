module Ticketee
  class Container
    extend Dry::Container::Mixin
  end

  Container.register(:project_repo, -> { ProjectRepository.new(ROM.env) })

	Import = Dry::AutoInject(Container)
end

