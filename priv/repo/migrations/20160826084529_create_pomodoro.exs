defmodule Pomex.Repo.Migrations.CreatePomodoro do
  use Ecto.Migration

  def change do
    create table(:pomodoros) do
      add :description, :string
      add :device_id, :string
      add :trigger_id, :string
      add :start_time, :datetime
      add :elapsed_time, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:pomodoros, [:user_id])

  end
end
