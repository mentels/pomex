defmodule Pomex.Pomodoro do
  use Pomex.Web, :model

  schema "pomodoros" do
    field :description, :string
    field :device_id, :string
    field :trigger_id, :string
    field :start_time, Ecto.DateTime
    field :elapsed_time, :integer
    belongs_to :user, Pomex.User

    timestamps()
  end

  @required_fields ~w(device_id trigger_id start_time user_id)a
  @optional_fields ~w(description elapsed_time)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
