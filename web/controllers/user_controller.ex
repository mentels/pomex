defmodule Pomex.UserController do
  use Pomex.Web, :controller

  alias Pomex.User
  alias Pomex.Pomodoro

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = User |> Repo.get!(id) |> Repo.preload([:pomodoros])
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end

  def add_pomodoro(conn,
                   %{"user_id" => user_id} = params) do
    id = case Pomex.Repo.all(from u in User,
                             where: u.user_id == ^user_id,
                             select: u) do
           [%User{:id => id}] -> id
           [] ->
             ucs = User.changeset(%User{:user_id => user_id,
                                        :name => user_id})
             {:ok, %User{:id => id}} = Pomex.Repo.insert(ucs)
             id
         end
    dt = Ecto.DateTime.autogenerate
    p0 = Map.put(params, "start_time", dt)
    changeset = Pomodoro.changeset(%Pomodoro{}, Map.put(p0, "user_id", id))

    if changeset.valid? do
      {:ok, %Pomodoro{id: pid}} = Repo.insert(changeset)
      json conn, %{"pid" => pid}
    else
      json conn, %{"error" => -1}
    end
    
  end
end
