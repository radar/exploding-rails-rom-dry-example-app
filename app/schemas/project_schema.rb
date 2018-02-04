require 'dry-validation'

ProjectSchema = Dry::Validation.Schema do
  required(:name).filled
end
