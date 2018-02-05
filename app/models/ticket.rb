class Ticket < ApplicationModel
  attribute :title, Types::Strict::String
  attribute :comment, Types::Strict::String
  attribute :project_id, Types::Strict::Int
  attribute :user_id, Types::Strict::Int
  attribute :user, Types::Constructor(User)
end
