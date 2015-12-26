defmodule DoTheCount.UserController do
  use DoTheCount.Web, :controller
  import IO

  def index(conn, _params) do
    users = Repo.all(DoTheCount.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(DoTheCount.User, id)
    render conn, "show.html", user: user
  end

end
