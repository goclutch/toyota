defmodule Toyota.Repo.Migrations.AddUserIdToProfile do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      add :user_id, references(:users), null: false
     end
  end
end
