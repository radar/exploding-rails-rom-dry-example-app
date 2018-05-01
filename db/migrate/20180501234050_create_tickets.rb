ROM::SQL.migration do
  change do
    create_table :tickets do
      primary_key :id
      String :title
      String :comment
      foreign_key :project_id, :projects
    end

    add_index :tickets, :project_id
  end
end
