module Projects
  class Project < ApplicationModel
    attribute :name, Types::Strict::String
  end
end
