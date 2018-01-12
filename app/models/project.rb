class Project
  include ActiveModel::Model

  attr_accessor :id, :name

  def persisted?
    id.present?
  end
end
