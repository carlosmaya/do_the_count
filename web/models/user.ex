defmodule DoTheCount.User do
  use DoTheCount.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :balance, :float
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end

end
