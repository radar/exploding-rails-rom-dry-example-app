require 'dry-validation'

module Projects
  ProjectSchema = Dry::Validation.Schema do
    required(:name).filled
  end
end
