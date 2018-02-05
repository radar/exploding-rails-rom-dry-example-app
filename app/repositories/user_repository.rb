class UserRepository < ROM::Repository::Root
  root :users

  commands :create, update: :by_pk, delete: :by_pk, mapper: :user
end
