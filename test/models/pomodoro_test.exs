defmodule Pomex.PomodoroTest do
  use Pomex.ModelCase

  alias Pomex.Pomodoro

  @valid_attrs %{description: "some content", device_id: "some content", elapsed_time: 42, start_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, trigger_id: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pomodoro.changeset(%Pomodoro{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pomodoro.changeset(%Pomodoro{}, @invalid_attrs)
    refute changeset.valid?
  end
end
