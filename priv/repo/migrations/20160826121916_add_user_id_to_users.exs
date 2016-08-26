defmodule Pomex.Repo.Migrations.AddUserIdToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :user_id, :string
    end
  end
end
