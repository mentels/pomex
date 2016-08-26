defmodule Pomex.User do
  use Pomex.Web, :model

  schema "users" do
    field :name, :string

    has_many :pomodoros, Pomex.Pomodoro
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([])
  end
end
