require 'dry-transaction'

class CreateProject
  include Dry::Transaction

  step :validate
  step :persist

  def validate(input)
    validation = ProjectSchema.(input)
    if validation.success?
      Success(input)
    else
      Failure(validation.errors)
    end
  end

  def persist(input)
    project = repo.create(input)

    Success(project)
  end

  private

  def repo
    ProjectRepository.new(ROM.env)
  end
end
