ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      String :username
    end

    alter_table :tickets do
      add_foreign_key :user_id, :tickets
    end
  end
end
